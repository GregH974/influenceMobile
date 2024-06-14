require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PlayersHelper. For example:
#
# describe PlayersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PlayersHelper, type: :helper do
  describe '#player_full_name' do
    let(:gender) { FactoryBot.create(:gender, :man) }
    let(:player) { build(:player, first_name: 'John', last_name: 'Doe', gender:) }

    it 'returns the full name of the player' do
      expect(helper.player_full_name(player)).to eq('John Doe')
    end
  end
end
