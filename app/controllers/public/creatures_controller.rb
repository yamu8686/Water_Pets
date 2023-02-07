class Public::CreaturesController < ApplicationController
  def index
    #@creature = Creture.new
    @creatures = Creature.all
    @user = current_user
  end

  def create
    @creature = Creature.new(creature_params)
    @creature.user.id = currect_user.id
    if @creature.save
      flash[:notice] = "投稿に成功しました"
      redirect_to creature_path(@creature)
    else
      flash[:alert]
      @creatures = Creature.all
      render :index
    end
  end

  def show
    @creatures = Creature.all
    @creature = Creature.find(params[:id])
    @user = current_user
    @comment = Comment.new 
  end

  def edit

  end

  private
  def creature_params
    params.require(:creature).permit(:name, :description, :image)
  end
end
