source 'https://rubygems.org'

#RUBY
ruby "2.2.1"

#RAILS
gem 'rails', '4.2.0'

#ADMIN
gem 'activeadmin', github: 'activeadmin'

#AUTHENTICATION
gem 'devise'
gem 'activeadmin-sortable'
gem 'omniauth-facebook'

#API
gem 'gibbon'
gem 'mandrill_mailer'

#ASSETS
gem 'ckeditor'
gem 'coffee-rails'
gem 'execjs'
gem 'foundation-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'rails3-jquery-autocomplete'
gem 'sass-rails'
gem 'therubyracer',  platforms: :ruby
gem 'uglifier'

#DB
gem 'pg'

#MODELS
gem 'carrierwave'
gem 'carrierwave-imageoptimizer'
gem 'date_validator'
gem 'fog'
gem 'friendly_id'
gem "geocoder"
gem 'mini_magick'
gem 'money-rails'
gem 'unf'
gem 'video_info'
gem 'acts_as_list'

#SERVER
gem 'unicorn'

#SETTINGS
gem 'figaro'

#VIEWS
gem 'formtastic'
gem 'nested_form'

#TEST
group :test do
  gem 'byebug'
  gem 'capybara'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'selenium-webdriver', '>=2.45.0.dev3'
  gem 'shoulda-matchers'
  gem 'webmock'
end

group :development, :test do
  gem 'letter_opener'
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'dalli'
  gem 'rails_12factor'
  gem 'unicorn'
end

#DOCS
gem 'sdoc', '~> 0.4.0',          group: :doc
