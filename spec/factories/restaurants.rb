FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| "The Restaurant#{n}" }
    description 'Restaurant'
    main_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'no-image.png')) }
    start_time Time.now
    end_time 1.day.from_now
  end
end
