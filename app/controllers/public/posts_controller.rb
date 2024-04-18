class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end 
  
  def show
    @post = Post.find(params[:id])
  end 
  
  def new
    @post = Post.new
  end 
  
  def create
    @post = Post.new
    @post.save
    redirect_to post_path(@post.id)
  end 
  
  def edit
    @post = Post.find(params[:id])
  end 
  
  def update
    @post = Post.find(params[:id])
    @post.update
    redirect_to post_path(@post.id)
  end 
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end 
  
  def pdf
  end 
  
  def search
  end 
  
  def search_result
  end 
  
  private

  def post_params
    params.require(:post).permit(:title, :shidouan_pdf, :caption, :subject_category_id, :unit_caregory_id)
  end
end
