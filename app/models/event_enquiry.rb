class EventEnquiry < ActiveRecord::Base
  include Concerns::ActsAsBookable

  after_create  :notify_admin
  after_create  :notify_user

  belongs_to :event, required: true

  validates :time, presence: { message: I18n.t('event_enquiries.errors.time') }
  validates :number_of_guests, presence: { message: I18n.t('event_enquiries.errors.number_of_guests') }
  validates :date, presence: { message: I18n.t('event_enquiries.errors.date') }

  private

  def notify_admin
    AdminMailer.notify_admin_new_enquiry(self, event.class.to_s).deliver_now
  end

  def notify_user
    UserMailer.complete_enquiry(self).deliver_now
  end
end
