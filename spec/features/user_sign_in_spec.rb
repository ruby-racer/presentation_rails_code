require 'rails_helper'

RSpec.describe 'signing in' do
  before(:each) do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
  end

  context 'user is approved' do
    let(:user) { FactoryGirl.create(:user, :approved) }

    it 'allows the user to sign in' do
      click_button 'Sign In'
      expect(current_path).to eq(splash_path)
    end
  end

  context 'user is not approved' do
    let(:user) { FactoryGirl.create(:user) }

    it 'does not allow the user to sign in' do
      click_button 'Sign In'
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
