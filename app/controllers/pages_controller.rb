class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @categories = Category.includes(:syllabuses).all
  end

  def my_profile
    @user = current_user
  end

end
