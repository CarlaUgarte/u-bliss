class CommentsController < ApplicationController
  def new

  end

  def create
    @comment = @lecture.comments.new(comment_params)
    @comment.user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
