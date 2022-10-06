class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(Text: comment_params[:Text], user: current_user)

    respond_to do |format|
      format.html do
        redirect_to user_post_path(post.user.id, post.id) if comment.save
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @status_update = Comment.find(params[:id])
    @status_update.destroy if @status_update.present?
    redirect_to user_post_path(post.user.id, post.id)
  end

  private

  def comment_params
    params.require(:data).permit(:Text)
  end
end
