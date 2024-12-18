class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    @syllabuses = Syllabus.all

    # Filtramos por categoría si está presente
    @syllabuses = @syllabuses.where(category: params[:category]) if params[:category].present?

    # Lógica para la búsqueda
    if params[:query].present?
      query = "%#{params[:query]}%"
      @categories = @categories.where("name ILIKE ?", query)
      @syllabuses = @syllabuses.where("title ILIKE ?", query)
      @syllabuses_modules = SyllabusModule.where("name ILIKE ?", query)
      @lectures = Lecture.where("details ILIKE ?", query)
    end
  end


  def new
    @syllabus = Syllabus.new
  end

  def create
    @syllabus = Syllabus.new(syllabus_params)
    @syllabus.user = current_user
    if @syllabus.save
      redirect_to new_syllabus_syllabus_module_path(@syllabus), notice: 'Syllabus fue exitosamente creado.'

    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

    @syllabus = Syllabus.includes(syllabus_modules: :lectures).find(params[:id])

  #cargar también módulos o bibliotecas asociadas
  @modules = @syllabus.syllabus_modules
  @libraries = @syllabus.libraries
  @user = current_user

  @syllabus = Syllabus.includes(syllabus_modules: :lectures).find(params[:id])

  total_lectures = @syllabus.syllabus_modules.sum { |mod| mod.lectures.count }
  completed_lectures = session[:completed_lectures].to_a.count
  @progress_percentage = total_lectures > 0 ? (completed_lectures.to_f / total_lectures * 100).round : 0
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
    redirect_to libraries_path, notice: 'Syllabus exitosamente borrado.'
  end

  private

  def set_syllabus
    @syllabus = Syllabus.find(params[:id])
  end

  def syllabus_params
    params.require(:syllabus).permit(:title, :category_id, :description, :image)
  end
end
