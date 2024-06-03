class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:latest]
      @posts = Post.latest.page(params[:page]).per(10)
    elsif params[:old]
      @posts = Post.old.page(params[:page]).per(10)
    else
      @posts = Post.all.page(params[:page]).per(10)
    end 
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
    post = Post.find(params[:id])
    @post_comments = post.post_comments.page(params[:page]).per(10)
    
  end 
  
  def search
    post = Post.search(params[:keyword], params[:subject_category_id])
    if params[:latest]
      @posts = post.latest.page(params[:page]).per(10)
    elsif params[:old]
      @posts = post.old.page(params[:page]).per(10)
    else
      @posts = post.all.page(params[:page]).per(10)
    end 
  end
  
end
