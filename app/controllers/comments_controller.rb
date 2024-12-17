class CommentsController < ApplicationController
  before_action :set_lecture
  before_action :authenticate_user!

  def index
    # if params[:lecture_id]
    #   @lecture = Lecture.find(params[:lecture_id])
    #   @comments = @lecture.comments
    # else
    #   @comments = Comment.all
    # end
    @lecture = Lecture.find(params[:lecture_id])
    @comments = @lecture.comments.where.not(user_id: nil)
    @comment = @lecture.comments.new
  end


  def new
    @comment = @lecture.comments.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @lecture.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html {redirect_to syllabuses_path}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = @lecture.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to lecture_comments_path(@lecture), notice: 'Comentario actualizado con éxito.'
    else
      @comments = @lecture.comments
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @lecture = @comment.lecture
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      format.html { redirect_to syllabuses_path, notice: 'Comentario eliminado con éxito.' }
    end
  end

  private


  def set_lecture
    @lecture = Lecture.find(params[:lecture_id]) if params[:lecture_id]
  end


  def comment_params
    params.require(:comment).permit(:content)
  end
end
