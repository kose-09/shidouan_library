class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end 
  
  def show
    @post = Post.find(params[:id])
  end 
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end 
  
  def post_comments
    @post = Post.find(params[:id])
  end 
  
  def search
    @post = Post.search(params[:keyword], params[:subject_category_id]).page(params[:page]).per(10)
  end
  
end
