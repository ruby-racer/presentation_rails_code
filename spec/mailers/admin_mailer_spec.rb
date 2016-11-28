require 'rails_helper'

RSpec.describe AdminMailer, type: :mailer do
  describe 'notify_admin' do
    let(:user) do
      User.skip_callback(:create, :after, :subscribe_to_mail_chimp)
      user = create(:user)
      User.set_callback(:create, :after, :subscribe_to_mail_chimp)
      user
    end
    subject { AdminMailer.notify_admin(user) }

    it 'renders the headers' do
      expect(subject.subject).to eq 'New Member'
      expect(subject.to).to match_array ['info@mail.com']
      expect(subject.from).to eq ['support@mail.com']
    end

    it 'renders the body with info about user' do
      expect(subject.body.encoded).to match user.full_name
    end
  end
end
