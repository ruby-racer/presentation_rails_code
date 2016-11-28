require 'rails_helper'

RSpec.feature 'create a new user account', type: :feature do
  let(:user) { build(:user) }

  describe 'new user' do
    before(:each) { visit new_user_registration_path }

    context 'user is not logged in' do
      it 'creates a new user' do
        fill_in 'user_first_name', with: user.first_name
        fill_in 'user_last_name', with: user.last_name
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        fill_in 'user_password_confirmation', with: user.password

        expect(click_button(I18n.t('users.form.register'))).to change(User.count)
        expect(page).to have_css('div.flash-notice.alert.j-flash-notice')
        expect(page.find('div.flash-notice.alert.j-flash-notice')).to have_content('You need to sign in or request an invite before continuing.')
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end
