class AdminMailer < ActionMailer::Base
  default from: 'support@site.co.uk'
  default to: 'info@site.co.uk'

  def notify_admin(user)
    @user = user
    mail subject: t('mailers.admin_mailer.subject')
  end

  def notify_admin_new_enquiry(enquiry, object_name)
    @user = enquiry.user
    @enquiry = enquiry
    @link = "admin_#{object_name.downcase}_enquiry_url(@enquiry)"
    mail subject: 'New enquiry'
  end
end
