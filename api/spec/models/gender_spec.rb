require 'rails_helper'

RSpec.describe Gender, type: :model do
  let(:gender) { FactoryBot.create(:gender, :man) }

  context 'when gender is valid' do
    it 'with name' do
      expect(gender).to be_valid
    end
  end

  context 'when gender is not valid' do
    it 'with no name' do
      gender.name = nil
      expect(gender).not_to be_valid
    end
  end
end
