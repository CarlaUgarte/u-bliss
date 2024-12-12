class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_profile
    @user = current_user  # Aquí accedemos al usuario logueado
  end

end
