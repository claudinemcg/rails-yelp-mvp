class ReviewsController < ApplicationController

  before_action :find_restaurant, except: [:destroy]# don't need only as it's used in both methods

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # the review belongs to a restaurant
    if @review.save # it will only save if the rating and content are there (validates in model)
      redirect_to restaurant_path(@restaurant.id)
    else # so if the rating and content aren't there it will go to the instance of this
      render :new # render html, new page which is my form
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) # path(route) is restaurant_id, not just id
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
