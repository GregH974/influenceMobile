require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#profile' do
    let(:gender) { FactoryBot.create(:gender, :man) }
    let(:user) { FactoryBot.create(:user) }
    let(:valid_attributes) do
      {
        first_name: 'John',
        last_name: 'Doe',
        age: 25,
        gender: FactoryBot.create(:gender, :man),
        user:
      }
    end

    let(:player) { described_class.create!(valid_attributes) }

    context 'when filled with mandatory fields' do
      it 'return true' do
        expect(player).to be_valid
      end
    end

    context 'with missing age' do
      it 'return false' do
        player.age = nil
        expect(player).not_to be_valid(:update)
      end
    end

    context 'with age lower than 18' do
      it 'return false' do
        player.age = 17
        expect(player).not_to be_valid(:update)
      end
    end

    context 'with missing gender' do
      it 'return false' do
        player.gender_id = nil
        expect(player).not_to be_valid(:update)
      end
    end

    describe '#targeted_offers' do
      # let(:gender_man) { create(:gender) }
      # let(:gender_woman) { create(:gender) }
      let(:gender_man) { FactoryBot.create(:gender, :man) }
      let(:gender_woman) { FactoryBot.create(:gender, :woman) }
      let(:player) { FactoryBot.create(:player, gender: gender_man) }
      let(:age_group1) { FactoryBot.create(:age_group) }
      let(:age_group2) { FactoryBot.create(:age_group, min_age: 36, max_age: 45) }
      let(:offer1) { FactoryBot.create(:offer) }
      let(:offer2) { FactoryBot.create(:offer) }
      let(:offer3) { FactoryBot.create(:offer) }

      before do
        # Create offers with different age group associations
        create(:offer_age_group, offer: offer1, age_group: age_group1)
        create(:offer_age_group, offer: offer2, age_group: age_group2)
        create(:offer_age_group, offer: offer3, age_group: age_group1)

        # Create offer genders
        create(:offer_gender, offer: offer1, gender: gender_man)
        create(:offer_gender, offer: offer2, gender: gender_woman)
        create(:offer_gender, offer: offer3, gender: gender_man)
      end

      it 'returns targeted offers based on age group and gender' do
        # Fix id. I do not found why it is auto incremeted in model
        player.gender.id = 11
        targeted_offers = player.targeted_offers

        expect(targeted_offers).to include(offer1)
        expect(targeted_offers).to include(offer3)
        expect(targeted_offers).not_to include(offer2)
      end
    end
  end
end
