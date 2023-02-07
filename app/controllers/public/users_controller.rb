class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new 
  end

  def show
    
  end

  def edit
    @user = User.find(params[:id])
  end
end
