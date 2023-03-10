class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @creatures = @user.creatures.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      flash[:user_update_error] = "会員情報が正常に保存できませんでした。"
      redirect_to edit_admin_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
