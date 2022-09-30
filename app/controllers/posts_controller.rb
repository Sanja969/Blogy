class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_3_posts
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

  def post_params
    params.require(:post).permit(:Author_id, :Title, :Text, :CommentsCounter, :LikesCounter)
  end
end
