class LibrariesController < ApplicationController

  def index
    @libraries = current_user.libraries
  end

  def show
    @library = Library.find(params[:id])
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to @library, notice: "La biblioteca fue creada con éxito.."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    redirect_to libraries_url, notice: "La biblioteca fue destruida con éxito."
  end

  private

  def library_params
    params.require(:library).permit(:user_id, :syllabus_id)
  end

end
