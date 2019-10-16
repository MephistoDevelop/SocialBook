class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.build(comments_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to @post
  end

  private

  def comments_params
    params(:comments).require(:content)
  end
end
