class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  after_filter :notify_admin, only: :create

  def create
    super
  end

  protected

  def configure_permitted_parameters
    permitted_params = [:first_name, :last_name, :email, :tel, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(permitted_params)
    end
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(permitted_params)
    end
  end

  def notify_admin
    AdminMailer.notify_admin(resource).deliver_now if resource.persisted?
  end
end
