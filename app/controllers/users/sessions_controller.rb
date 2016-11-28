class Users::SessionsController < Devise::SessionsController
  before_filter :deny_non_approved, only: :create

  private

  def deny_non_approved
    begin
      user = User.find_by_email(params[:user][:email])
      redirect_to(new_user_session_path, alert: t('.not_approved')) unless user.approved
    rescue
    end
  end
end
