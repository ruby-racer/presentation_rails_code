class RestaurantEnquiriesController < ApplicationController
  before_filter :load_restaurant

  def new
    @restaurant_enquiry = @restaurant.enquiries.new
  end

  def create
    @restaurant_enquiry = @restaurant.enquiries.new(restaurant_enquiry_params)
    @restaurant_enquiry.user = current_user
    respond_to do |format|
      if @restaurant_enquiry.save
        format.html { redirect_to restaurant_path(@restaurant), notice: I18n.t('restaurant_enquiries.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  private

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def restaurant_enquiry_params
    params.require(:restaurant_enquiry).permit(:restaurant_id, :time, :date, :message, :number_of_guests)
  end
end
