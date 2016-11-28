require 'rails_helper'

RSpec.describe RestaurantEnquiry, type: :model do
  describe 'validations' do
    it { expect(build(:restaurant_enquiry)).to be_valid }

    it { expect(build(:restaurant_enquiry, restaurant: nil)).to_not be_valid }

    it { expect(build(:restaurant_enquiry, number_of_guests: nil)).to_not be_valid }

    it { expect(build(:restaurant_enquiry, time: nil)).to_not be_valid }
  end
end
