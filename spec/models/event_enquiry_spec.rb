require 'rails_helper'

RSpec.describe EventEnquiry, type: :model do
  describe 'validations' do
    it { expect(build(:event_enquiry)).to be_valid }

    it { expect(build(:event_enquiry, event: nil)).to_not be_valid }

    it { expect(build(:event_enquiry, number_of_guests: nil)).to_not be_valid }

    it { expect(build(:event_enquiry, time: nil)).to_not be_valid }
  end
end
