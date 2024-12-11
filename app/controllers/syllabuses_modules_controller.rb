class SyllabusesModulesController < ApplicationController
  def new
    @syllabus = Syllabus.find(params[:syllabus_id])
    @syllabus_module = SyllabusModule.new
  end

  def create
    @syllabus_module = SyllabusModule.new(syllabus_module_params)
    @syllabus_module.user = current_user
    if @syllabus_module.save
      redirect_to syllabuses_path(@syllabus)
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
    params.require(:syllabus).permit(:name, :syllabus_id)
  end

end
