class CommentsController < ApplicationController
  before_action :set_lecture
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def new
    @comment = @lecture.comments.new
  end

  def create
    @comment = @lecture.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to lecture_path(@lecture), notice: "Comentario creado con éxito."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to lecture_path(@lecture), notice: "Comentario actualizado con éxito."
    else
      render :edit
    end
  end

  def destroy
     @comment.destroy
    redirect_to lecture_path(@lecture), notice: "Comentario eliminado con éxito."
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def set_comment
    @comment =  @lecture.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
