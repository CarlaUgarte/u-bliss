class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @categories = Category.all
    @categories.each do |category|
      category.syllabuses = category.syllabuses.limit(3) # Limit syllabuses to 3 per category
    end
  end
  def my_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Perfil actualizado correctamente."
      redirect_to my_profile_path
    else
      flash[:alert] = "Hubo un error al actualizar el perfil."
      render :my_profile
    end
  end 

  def destroy
    begin
      if current_user.destroy
        redirect_to root_path, notice: "Cuenta eliminada correctamente."
      else
        redirect_to mi_perfil_path, alert: "Hubo un problema al intentar eliminar tu cuenta."
      end
    rescue => e
      redirect_to mi_perfil_path, alert: "Error al eliminar la cuenta: #{e.message}"
    end
  end

  def destroy
    begin
      if current_user.destroy
        redirect_to root_path, notice: "Cuenta eliminada correctamente."
      else
        redirect_to mi_perfil_path, alert: "Hubo un problema al intentar eliminar tu cuenta."
      end
    rescue => e
      redirect_to mi_perfil_path, alert: "Error al eliminar la cuenta: #{e.message}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :description, :linkedin_url, :photo)
  end
end
