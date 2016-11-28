module Concerns::ActsAsBookable
  extend ActiveSupport::Concern

  included do
    attr_accessor :from_day, :from_month, :to_day, :to_month

    belongs_to :user, required: true
    has_many :booking_requests, as: :bookable

    after_create :create_booking_request!
  end

  private

  def create_booking_request!
    booking_requests.create!
  end
end
