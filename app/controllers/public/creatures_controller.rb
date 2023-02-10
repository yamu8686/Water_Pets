class Public::CreaturesController < ApplicationController

  def index
    @creature = Creature.new
    @creatures = Creature.all
    @user = current_user
  end

  def create
    #投稿するデータをcreatureモデルに紐づくデータとして保存する準備
    @creature = Creature.new(creature_params)

    #投稿データに今ログイン中のユーザーのIDを持たせる
    @creature.user_id = current_user.id
    if @creature.save
      flash[:notice] = "投稿に成功しました"
      redirect_to public_creature_path(@creature)
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
    @post_comment = PostComment.new
  end

  def edit
    @creature = Creature.find(params[:id])
  end

  def update
    creature = Creature.find(params[:id])
    creature.update(creature_params)
    redirect_to public_creature_path(creature.id)
  end

  def destroy
    creature = Creature.find(params[:id])
    creature.destroy
    redirect_to public_creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :description, :image)
  end
end
