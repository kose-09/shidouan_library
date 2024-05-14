class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました。"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def search
    @post = Post.search(params[:keyword], params[:subject_category_id]).page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :shidouan_pdf, :caption, :subject_category_id)
  end
  
  def is_matching_login_user
    post = Post.find(params[:id])
    user = post.user
    unless user == current_user
      redirect_to posts_path
    end 
  end 
  
end
