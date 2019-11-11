# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    key = params[:post_id]
    @comment = Comment.new(post_id: key)
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.save
    redirect_to post_path(comments_params[:post_id])
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
end
