class EventsController < ApplicationController
  def index
    @events = Event.is_visible.by_position
  end

  def show
    @event = Event.find(params[:id])
    @event_enquiry = @event.enquiries.build
    @images = @event.images.by_position
  end
end
