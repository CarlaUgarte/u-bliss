class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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
    current_user.destroy # Elimina al usuario actual
    flash[:notice] = "Tu cuenta ha sido eliminada correctamente."
    redirect_to root_path # Redirige a la página principal u otra ruta
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :description, :linkedin_url, :photo)
  end

end
