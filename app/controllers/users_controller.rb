class UsersController < ApplicationController
  before_filter :load_user

  respond_to :html

  def show
    redirect_to edit_user_path(@user)
  end

  def edit
    respond_with @user
  end

  def update
    flash[:alert] = I18n.t('users.successfully_updated') if @user.update_attributes(user_params)
    respond_with @user, location: edit_user_path(@user)
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
