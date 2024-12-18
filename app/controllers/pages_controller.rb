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
      redirect_to my_profile_path, notice: 'Perfil actualizado exitosamente.'
    else
      render :my_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :description, :linkedin, :avatar)
  end

end
