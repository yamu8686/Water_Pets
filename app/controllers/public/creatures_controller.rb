class Public::CreaturesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :edit]
  before_action :currect_user, only: [:edit, :update]

  def index
    @creature = Creature.new
    @user = current_user
    @creatures = params[:tag_id].present? ? Tag.find(params[:tag_id]).creatures : Creature.all
    @creatures = @creatures.where(is_published_flag: false).order("created_at DESC").page(params[:page]).per(10)
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
      @creatures = params[:tag_id].present? ? Tag.find(params[:tag_id]).creatures : Creature.all
      @creatures = @creatures.where(is_published_flag: false).page(params[:page]).per(10)
      @user = current_user
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
    @creature = Creature.find(params[:id])
    if @creature.update(creature_params)
      flash[:notice] = "編集に成功しました"
      redirect_to public_creature_path(@creature.id)
    else
      @creatures = Creature.all
      render :edit
    end
  end

  def destroy
    creature = Creature.find(params[:id])
    creature.destroy
    redirect_to public_creatures_path
  end

  private

  def creature_params
    params.require(:creature).permit(:name, :description, :image, :rate, :is_published_flag, tag_ids: [] )
  end

  def currect_user
    @creature = Creature.find(params[:id])
    @user = @creature.user
    redirect_to (public_creatures_path) unless @user == current_user
  end
end
