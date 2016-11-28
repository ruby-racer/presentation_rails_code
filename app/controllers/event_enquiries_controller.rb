class EventEnquiriesController < ApplicationController
  before_filter :load_event

  def new
    @event_enquiry = @event.enquiries.new
  end

  def create
    @event_enquiry = @event.enquiries.new(event_enquiry_params)
    @event_enquiry.user = current_user
    respond_to do |format|
      if @event_enquiry.save
        format.html do
          redirect_to event_path(@event),
                      notice: I18n.t('event_enquiries.successfully_created')
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def event_enquiry_params
    params.require(:event_enquiry).permit(:event_id, :number_of_guests,
                                          :time, :date, :message)
  end
end
