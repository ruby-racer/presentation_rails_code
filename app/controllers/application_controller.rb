class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  http_basic_authenticate_with name: 'staged', password: 'site2015' if Rails.env.staging?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || splash_path
  end
end
