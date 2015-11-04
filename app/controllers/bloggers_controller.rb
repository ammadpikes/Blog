class BloggersController < ApplicationController

  before_action :user_signed_in?, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_blog_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blogger.all.paginate(:page => params[:page])
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
    respond_to do |format|
      format.html { redirect_to bloggers_path }
      format.js
      end
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

