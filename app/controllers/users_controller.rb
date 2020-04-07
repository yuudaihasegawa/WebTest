class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :login_user, only: [:edit,:update]
  def login_user
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end