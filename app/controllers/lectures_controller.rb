class LecturesController < ApplicationController
  def new
    @syllabus_module = SyllabusModule.find(params[:syllabus_module_id])
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.user = current_user
    if @lecture.save
      redirect_to syllabuses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture.update(lecture_params)
    redirect_to syllabus_path(@lecture)
  end

  def destroy
    @lecture.destroy
    redirect_to syllabuses_path, status: :see_other
  end

  private

  def lecture_params
    params.require(:syllabus_module).permit(:details, :syllabus_module_id)
  end
end
