class Admin::CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
  end

  def edit
  end

  def destroy
    Creature.destroy(params[:id])
    redirect_to admin_creatures_path
  end

  def admin_check
    unless user_signed_in? && current_user.role == :staff
      redirect_to root_path
      flash[:notice] = "管理者画面です"
    end
  end
end
