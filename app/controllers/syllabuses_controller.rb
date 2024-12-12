class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  def index
    if params[:category].present?
      @syllabuses = Syllabus.where(category: params[:category])
    else
      @syllabuses = Syllabus.all
    end
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

    @syllabus = Syllabus.find(params[:id]) # Encuentra el syllabus por su ID

    # Si necesitas @syllabuses, asegúrate de inicializarla
    @syllabuses = Syllabus.where(category_id: @syllabus.category_id) if @syllabus.respond_to?(:category_id)

    # También necesitas inicializar @category si se usa en la vista
    @category = @syllabus.category if @syllabus.respond_to?(:category)

    @syllabus = Syllabus.includes(syllabus_modules: :lectures).find(params[:id])

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
