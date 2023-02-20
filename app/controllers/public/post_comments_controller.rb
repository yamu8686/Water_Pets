class Public::PostCommentsController < ApplicationController

  def create
    creature = Creature.find(params[:creature_id])
    @comment = current_user.post_comments.build(post_comment_params)
    @comment.creature_id = creature.id
    @comment.save
    @count = @comment.creature.post_comments.size
  end

  def destroy
    @comment = current_user.post_comments.find_by(id: params[:id])
    @comment.destroy if @comment
    @count = @comment.creature.post_comments.size
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
