class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
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
  end 
  
  def withdrawal
  end 
  
  def my_favorites
  end 
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
