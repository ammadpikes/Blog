class ConversationsController < ApplicationController

  before_action :authenticate_user!

  def index
      @users = User.all
      @conversations = Conversation.all
  end

    def create
      if Conversation.between(params[:sender_id],params[:receiver_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    end

    def destroy
      @conversation = Conversation.find(params[:id])
      if @conversation.destroy
        flash[:success] = "Conversation Deleted Successfully"
        redirect_to conversations_path
      end
    end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end


end
