class CommentsController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def create
    @comment = Comment.create(strong_params)

    respond_to do |format|
      format.html {  redirect_to blogger_path(params[:blogger_id]) }
      format.js
    end
  end

  def destroy
    blog = Blogger.find(params[:blogger_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html {  }
        format.js
      end
    end
  end


  private

  def strong_params
    params.require(:comment).permit(:name, :content, :blogger_id, :user_id)
  end

end
