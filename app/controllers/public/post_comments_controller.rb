class Public::PostCommentsController < ApplicationController

  def create
    creature = Creature.find(params[:creature_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.creature_id = creature.id
    @comment.save
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
