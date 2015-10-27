class BloggersController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @blog = current_user.bloggers.all.order('created_at DESC')
  end

  def new
    @blog = Blogger.new
  end

  def create
    @blog = current_user.bloggers.new(user_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
    @blog = Blogger.find_by(id: params[:id])
  end

  def edit
    @blog = Blogger.find_by(params[:id])
  end

  def update
    @blog = Blogger.find_by(id: params[:id])
    if @blog.update(user_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blogger.find_by(id: params[:id])
    if @blog.destroy
      redirect_to bloggers_path
    else
      redirect_to bloggers_path
    end
  end

  private

  def user_params
    params.require(:blogger).permit(:title, :content)
  end

end

