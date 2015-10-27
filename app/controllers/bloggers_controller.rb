class BloggersController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, 
                :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @blogs = current_user.bloggers.all
  end

  def new
    @blogs = Blogger.new
  end

  def create
    @blogs = current_user.bloggers.new(user_params)
    if @blogs.save
      flash[:success] = "Blog Saved Successfully"
      redirect_to @blogs
    else
      flash.now[:danger] = "Error Saving Blog"
      render 'new'
    end
  end

  def show
    @blogs = Blogger.find_by(params[:id])
  end

  def edit
    @blogs = Blogger.find_by(params[:id])
  end

  def update
    @blogs = Blogger.find_by(params[:id])
    if @blogs.update(user_params)
      flash[:success] = "Blog Updated Successfully"
      redirect_to @blogs
    else
      flash.now[:danger] = "Error Saving Blog"
      render 'edit'
    end
  end

  def destroy
    @blogs = Blogger.find_by(params[:id])
    if @blogs.destroy
      flash[:success] = "Blog Deleted Successfully"
      redirect_to bloggers_path
    else
      flash.now[:danger] = "Error Deleting Blog"
      redirect_to bloggers_path
    end
  end

  private

  def user_params
    params.require(:blogger).permit(:title, :content)
  end

end

