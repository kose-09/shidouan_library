class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to admin_user_path(@user)
    else 
      render :edit 
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end 
  
end
