class MessagesController < ApplicationController

  before_action :get_conversation

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
   @message = @conversation.messages.new
  end
  
  def create
   @message = @conversation.messages.new(message_params)
   if @message.save
    redirect_to conversation_messages_path(@conversation)
   end
  end
  
  private
   def message_params
    params.require(:message).permit(:message_body, :user_id)
   end

   def get_conversation
     @conversation = Conversation.find(params[:conversation_id])
   end

end
