class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.order('created_at')
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(current_user, @post.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: user_post_path(current_user, @post.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @status_update = Post.find(params[:id])
    @status_update.destroy if @status_update.present?
    redirect_to root_url
  end

  def post_params
    params.require(:post).permit(:Author_id, :Title, :Text, :CommentsCounter, :LikesCounter)
  end
end
