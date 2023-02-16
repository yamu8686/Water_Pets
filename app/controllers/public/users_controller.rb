class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @creatures = @user.creatures.page(params[:page])
    @creature = Creature.new
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user)
    else
      @users = User.all
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
