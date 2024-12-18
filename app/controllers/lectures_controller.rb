class LecturesController < ApplicationController
  before_action :set_syllabus_module, only: %i[new create]
  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.syllabus_module = @syllabus_module
    if @lecture.save
      respond_to do |format|
        format.turbo_stream
        format.html {redirect_to @lecture}
      end
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
    params.require(:lecture).permit(:details)
  end

  def set_syllabus_module
    @syllabus_module = SyllabusModule.find(params[:syllabus_module_id])
  end
end
