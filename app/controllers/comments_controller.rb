# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    key = params[:key]
    @comment = Comment.new(post_id: key)
  end

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.save
    redirect_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
