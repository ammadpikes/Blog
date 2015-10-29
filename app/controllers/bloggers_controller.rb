class BloggersController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_blog_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blogger.all.order('created_at DESC')
  end

  def new
    @blog = Blogger.new
  end

  def create
    @blog = current_user.bloggers.new(user_params)
    if @blog.save
      redirect_to bloggers_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(user_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
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

  def get_blog_by_id
    @blog = Blogger.find_by(id: params[:id])
  end
end

