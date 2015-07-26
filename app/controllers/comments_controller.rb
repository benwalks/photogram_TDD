class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = 'Nice comment!'
      redirect_to root_path
    else
      flash[:alert] = 'Check the coment form, something went wrong'
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.delete
      flash[:notice] = 'Comment deleted.'
      redirect_to root_path
    else
      flash[:warning] = "That doesn't belong to you!"
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_owner

  end
end
