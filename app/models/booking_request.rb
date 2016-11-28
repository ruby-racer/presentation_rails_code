class BookingRequest < ActiveRecord::Base
  belongs_to :bookable, polymorphic: true, required: true, touch: true
end
