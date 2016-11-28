require 'rails_helper'

RSpec.feature 'Show interval or date', type: :feature do
  before(:each) do
    login_as create(:user), scope: :user
    visit event_path(event.id)
  end

  context 'event spans multiple days' do
    let(:event) { create(:event) }

    it 'shows an interval' do
      expect(page).to have_css('div.individualSection-item--text.u-verticalAlign--center')
      within('div.individualSection-item--text.u-verticalAlign--center') do
        expect(find('ul li:nth-child(2)').text).to eq("#{I18n.localize(event.start_date, format: :short)} - #{I18n.localize(event.end_date, format: :short)}")
        expect(page).to have_selector('li', count: 6)
      end
    end
  end
  context 'event has one date' do
    let(:event) { create(:event, end_date: nil) }

    it 'shows one date' do
      expect(page).to have_css('div.individualSection-item--text.u-verticalAlign--center')
      within('div.individualSection-item--text.u-verticalAlign--center') do
        expect(find('ul li:nth-child(2)').text).to eq(I18n.localize(event.start_date, format: :short))
        expect(page).to have_selector('li', count: 6)
      end
    end
  end

  context 'event without dates' do
    let(:event) { create(:event, start_date: nil, end_date: nil) }

    it 'doesn\'t show dates' do
      expect(page).to have_css('div.individualSection-item--text.u-verticalAlign--center')
      within('div.individualSection-item--text.u-verticalAlign--center') do
        expect(find('ul li:nth-child(2)').text).to eq ''
        expect(page).to have_selector('li', count: 6)
      end
    end
  end
end
