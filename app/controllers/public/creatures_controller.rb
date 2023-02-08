class Public::CreaturesController < ApplicationController

  def new
    @creature = Creature.new
  end

  def index
    @creatures = Creature.all
    @user = current_user
  end

  def create
    @creature = Creature.new(creature_params) #投稿するデータをcreatureモデルに紐づくデータとして保存する準備
    @creature.user.id = currect_user.id　#投稿データに今ログイン中のユーザーのIDを持たせる
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
