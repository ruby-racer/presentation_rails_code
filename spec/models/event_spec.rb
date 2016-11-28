require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { build(:event) }

  it_behaves_like 'acts as cacheable'
  it_behaves_like 'acts as invisible'
  it_behaves_like 'acts as listable'
  it_behaves_like 'acts as seoable'

  describe 'validations' do
    it { expect(event).to be_valid }
    it { expect(build(:event, name: nil)).to_not be_valid }
    it { expect(build(:event, description: nil)).to_not be_valid }
    it { expect(build(:event, main_image: nil)).to_not be_valid }
    it { expect(build(:event, start_time: nil)).to_not be_valid }
    it { expect(build(:event, end_time: nil)).to_not be_valid }
  end
end
