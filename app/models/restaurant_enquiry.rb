class RestaurantEnquiry < ActiveRecord::Base
  include Concerns::ActsAsBookable

  belongs_to :restaurant, required: true

  after_create  :notify_admin
  after_create  :notify_user

  validates :time, presence: { message: I18n.t('restaurant_enquiries.errors.time') }
  validates :number_of_guests, presence: { message: I18n.t('restaurant_enquiries.errors.number_of_guests') }

  private

  def notify_admin
    AdminMailer.notify_admin_new_enquiry(self, restaurant.class.to_s).deliver_now
  end

  def notify_user
    UserMailer.complete_enquiry(self).deliver_now
  end
end
