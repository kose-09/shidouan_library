class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_matching_login_user, only: [:destroy]
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
  end 
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to post_post_comments_path(params[:post_id])
  end 
  
  def index
    post = Post.find(params[:post_id])
    @post_comments = post.post_comments.page(params[:page]).per(10)
  end 
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end 
  
  def is_matching_login_user
    post_comment = PostComment.find(params[:id])
    user = post_comment.user
    unless user == current_user
      redirect_to post_post_comments_path(params[:post_id])
    end 
  end 
  
end
