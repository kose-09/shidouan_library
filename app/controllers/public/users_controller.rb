class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :my_favorites]
  before_action :is_matching_login_user, except: [:show, :my_favorites]
  

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def confirm_withdrawal
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def my_favorites
    @user = User.find(params[:id])
    my_favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(my_favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to posts_path
    end 
  end 
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面に遷移できません。"
    end 
  end 

end
