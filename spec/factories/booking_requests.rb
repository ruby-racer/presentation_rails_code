FactoryGirl.define do
  factory :booking_request do
    bookable { create(:boat) }
  end
end
