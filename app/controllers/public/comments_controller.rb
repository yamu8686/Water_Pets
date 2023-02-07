class Public::CommentsController < ApplicationController
  def create
    creature = Creature.find(params[:creature_id])
    comment = current_user.comments.new(comment_params)
    comment.creature_id = creature.id
    comment.save
    redirect_to creature_path(creature)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
