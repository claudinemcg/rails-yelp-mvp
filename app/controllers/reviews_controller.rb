class ReviewsController < ApplicationController

  before_action :find_restaurant # don't need only as it's used in both methods

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # review belongs to a restaurant
    @review.save
    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) # path(route) is restaurant_id, not just id
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
