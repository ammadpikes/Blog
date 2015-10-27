class CommentsController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def create
    @comment = Comment.create(strong_params)
    redirect_to blogger_path(params[:blogger_id])
  end

  def destroy
    
  end


  private

  def strong_params
    params.require(:comment).permit(:name, :content, :blogger_id, :user_id)
  end

end
