class Public::PostCommentsController < ApplicationController

  def create
    creature = Creature.find(params[:creature_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.creature_id = creature.id
    comment.save
    redirect_to public_creature_path(creature)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_creature_path(params[:creature_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
