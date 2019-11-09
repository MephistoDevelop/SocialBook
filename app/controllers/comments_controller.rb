# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comments_params)
    redirect_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
end
