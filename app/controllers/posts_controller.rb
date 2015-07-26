class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Halt, you fiend! You need an image to post here!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated hombre.'
      redirect_to root_path
    else
      flash[:alert] = 'Something is wrong with your form!'
      redirect_to root_path
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Problem solved!  Post deleted.'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless @post.user.id == current_user.id
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
end
