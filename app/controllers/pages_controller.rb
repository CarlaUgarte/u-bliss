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

end
