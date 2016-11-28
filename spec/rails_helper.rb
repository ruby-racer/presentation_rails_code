ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/email/rspec'
require 'webmock/rspec'
require 'mandrill_mailer/offline'

ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect!(allow_localhost: true)

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before :each do
    DatabaseCleaner.strategy = Capybara.current_driver == :rack_test ? :transaction : :truncation
    DatabaseCleaner.start
    MandrillMailer.deliveries.clear
  end

  config.include MailerMacros
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, type: :controller

  config.before(:each) do
    stub_request(:any, /.*mailchimp.*/).to_return(status: 200, body: "", headers: {})
    stub_request(:any, /.*googleapis.*/).to_return(body: File.read(File.join("spec", "fixtures", "geocoder", "google_maps.json")))
    stub_request(:any, /.*youtube.*/).to_return(status: 200, body: "", headers: {})
  end

  config.after { DatabaseCleaner.clean }

  config.include Devise::TestHelpers, type: :controller
end
