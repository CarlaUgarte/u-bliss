class SyllabusesModulesController < ApplicationController
  before_action :set_syllabus, only: %i[new create]
  def new
    @syllabus_module = SyllabusModule.new
  end

  def create
    @syllabus_module = SyllabusModule.new(syllabus_module_params)
    @syllabus_module.syllabus = @syllabus
    if @syllabus_module.save!
      redirect_to new_syllabus_module_lecture_path(@syllabus_module)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @syllabus_module = SyllabusModule.find(params[:id])
  end

  def update
    @syllabus_module.update(syllabus_module_params)
    redirect_to syllabus_path(@syllabus_module)
  end

  def destroy
    @syllabus_module.destroy
    redirect_to syllabuses_path, status: :see_other
  end

  private

  def syllabus_module_params
    params.require(:syllabus_module).permit(:name )
  end

  def set_syllabus
    @syllabus = Syllabus.find(params[:syllabus_id])
  end

end
