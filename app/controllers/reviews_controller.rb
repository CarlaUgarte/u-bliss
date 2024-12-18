class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @syllabus = Syllabus.find(params[:syllabus_id])
    @review.syllabus = @syllabus
    if @review.save
      redirect_to @syllabus
    end
  end

  private


  def review_params
    params.require(:review).permit(:rating)
  end
end
