class UserMailer < ActionMailer::Base
  default from: 'support@site.co.uk'

  def complete_registration(user)
    @user = user
    mail to: user.email, subject: t('mailers.user_mailer.subject')
  end

  def complete_enquiry(enquiry)
    @enquiry = enquiry
    @user = enquiry.user
    mail to: @user.email, subject: 'Enquiry'
  end
end
