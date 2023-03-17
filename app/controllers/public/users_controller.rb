class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  def index
    @users = User.all.page(params[:page]).per(10)
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @creatures = @user.creatures.page(params[:page]).per(10)
    #@creatures = @creatures.where(is_published_flag: false)
    @creature = Creature.new
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました"
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

  def correct_user
    @user = User.find(params[:id])
    redirect_to(public_users_path) unless @user == current_user
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
