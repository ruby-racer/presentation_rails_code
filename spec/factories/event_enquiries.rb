FactoryGirl.define do
  factory :event_enquiry do
    user
    event
    number_of_guests 1
    time 1.day.from_now
    date 1.day.from_now
    message 'test message'
  end
end
