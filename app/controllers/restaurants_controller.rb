class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.is_visible.by_position
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_enquiry = @restaurant.enquiries.build
    @images = @restaurant.images.by_position
  end
end
