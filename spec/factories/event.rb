FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "The Event#{n}" }
    description 'Event'
    main_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'no-image.png')) }
    start_time Time.now
    end_time 1.day.from_now
    start_date 1.day.from_now
    end_date 2.days.from_now
  end
end
