class CommentsController < ApplicationController
  before_action :set_lecture, only: [:new, :create, :index]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @lecture
    @comments = @lecture.comments
  end

  def new
    @comment = @lecture.comments.build
  end

  def create
    @comment = @lecture.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to lecture_comments_path(@lecture), notice: 'Comentario creado con éxito.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to lecture_comment_path(@comment.lecture, @comment), notice: 'Comentario actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to lecture_comments_path(@comment.lecture), notice: 'Comentario eliminado con éxito.'
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
