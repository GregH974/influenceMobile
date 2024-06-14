require 'rails_helper'

RSpec.describe AgeGroup, type: :model do
  let(:age_group) { FactoryBot.create(:age_group) }

  context 'when age_group is valid' do
    it 'with ages' do
      expect(age_group).to be_valid
    end
  end

  context 'when age_group is not valid' do
    it 'with no age min' do
      age_group.min_age = nil
      expect(age_group).not_to be_valid
    end

    it 'with no age max' do
      age_group.max_age = nil
      expect(age_group).not_to be_valid
    end

    it 'with no age max lower than min age' do
      age_group.min_age = 25
      age_group.max_age = 15
      expect(age_group).not_to be_valid
    end
  end
end
