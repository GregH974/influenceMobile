require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe '#offers' do
    let(:offer) { FactoryBot.create(:offer) }

    context 'when offer is valid' do
      it 'with title, description and score_to_achieve present' do
        expect(offer).to be_valid
      end
    end

    context 'when offer is not valid' do
      it 'when title is not present' do
        offer.title = nil
        expect(offer).not_to be_valid
      end

      it 'when description is not present' do
        offer.description = nil
        expect(offer).not_to be_valid
      end

      it 'when score_to_achieve is not present' do
        offer.score_to_achieve = nil
        expect(offer).not_to be_valid
      end
    end
  end
end
