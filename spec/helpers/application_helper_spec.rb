require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#interval_or_one_date' do
    context 'event spans multiple days' do
      let(:event) { create(:event) }

      it 'returns an interval' do
        expect(interval_or_one_date(event)).to eq("#{l(event.start_date, format: :short)} - #{l(event.end_date, format: :short)}")
      end
    end

    context 'event has one date' do
      let(:event) { create(:event, end_date: nil) }

      it 'return date' do
        expect(interval_or_one_date(event)).to eq(l(event.start_date, format: :short))
      end
    end

    context 'event without dates' do
      let(:event) { create(:event, start_date: nil, end_date: nil) }

      it 'return blank' do
        expect(interval_or_one_date(event)).to eq('')
      end
    end
  end
end
