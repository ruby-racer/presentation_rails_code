require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'complete_registration' do
    let(:user) do
      User.skip_callback(:create, :after, :subscribe_to_mail_chimp)
      user = create(:user)
      User.set_callback(:create, :after, :subscribe_to_mail_chimp)
      user
    end
    subject { UserMailer.complete_registration(user) }

    it 'renders the headers' do
      expect(subject.subject).to eq 'Welcome to site'
      expect(subject.to).to match_array user.email
      expect(subject.from).to eq ['support@site.co.uk']
    end

    it 'renders the body with info about user' do
      expect(subject.body.encoded).to match user.first_name
    end
  end
end
