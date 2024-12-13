class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    if params[:category].present?
      @syllabuses = Syllabus.where(category: params[:category])
    else
      @syllabuses = Syllabus.all
    end
      #CODIGO PARA EL BUSCADOR, BUSCARÁ EN TODO LO QUE SE RELACIONE CON LA PALABRA QUE INGRESE EL USUARIO
      # Inicializamos las variables para las búsquedas
      @syllabuses = Syllabus.all
      @syllabuses_modules = SyllabusModule.all
      @lectures = Lecture.all
  
      # Filtramos por categoría si está presente
      if params[:category].present?
        @syllabuses = Syllabus.where(category: params[:category])
      end
  
      # Lógica para la búsqueda
      if params[:query].present?
        query = "%#{params[:query]}%"
  
        sql_subquery = <<~SQL
          categories.name ILIKE :query
          OR syllabuses.title ILIKE :query
          OR syllabuses_modules.name ILIKE :query
          OR lectures.details ILIKE :query
        SQL
  
        @categories = @categories.where("name ILIKE ?", query)
        @syllabuses = @syllabuses.where("title ILIKE ?", query)
        @syllabuses_modules = @syllabuses_modules.where("name ILIKE ?", query)
        @lectures = @lectures.where("details ILIKE ?", query)
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
    params.require(:syllabus).permit(:title, :category_id, :description, :image)
  end
end
