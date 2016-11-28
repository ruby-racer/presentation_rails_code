require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { build(:restaurant) }

  it_behaves_like 'acts as cacheable'
  it_behaves_like 'acts as invisible'
  it_behaves_like 'acts as listable'
  it_behaves_like 'acts as seoable'

  describe 'validations' do
    it { expect(restaurant).to be_valid }
    it { expect(build(:restaurant, name: nil)).to_not be_valid }
    it { expect(build(:restaurant, description: nil)).to_not be_valid }
    it { expect(build(:restaurant, main_image: nil)).to_not be_valid }
    it { expect(build(:restaurant, start_time: nil)).to_not be_valid }
    it { expect(build(:restaurant, end_time: nil)).to_not be_valid }
  end
end
