class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  def index
    @syllabuses = Syllabus.all
  end

  def new
    @syllabus = Syllabus.new
  end

  def create
    @syllabus = Syllabus.new(syllabus_params)
    if @syllabus.save
      redirect_to @syllabus, notice: 'Syllabus was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    #cargar también módulos o bibliotecas asociadas
    @modules = @syllabus.syllabus_modules
    @libraries = @syllabus.libraries
  end

  def edit
  end

  def update
    if @syllabus.update(syllabus_params)
      redirect_to @syllabus, notice: 'Syllabus exitosamente actualizado.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @syllabus.destroy
    redirect_to syllabuses_path, notice: 'Syllabus exitosamente borrado.'
  end

  private

  def set_syllabus
    @syllabus = Syllabus.find(params[:id])
  end

  def syllabus_params
    params.require(:syllabus).permit(:title, :description)
  end
end
