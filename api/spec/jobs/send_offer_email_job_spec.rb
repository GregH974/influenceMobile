RSpec.describe SendOfferEmailJob, type: :job do
  let!(:gender) { FactoryBot.create(:gender, :man) }
  let!(:player) { create(:player, gender:) }
  let!(:offer) { create(:offer) }
  let!(:offer_player) { create(:offer_player, offer:, player:, email_send: false) }

  before do
    allow(PlayerMailer).to receive_message_chain(:claim_offer_email, :deliver_now)
  end

  context 'when the job is called' do
    it 'sends an email' do
      described_class.perform_now(offer_player)
      expect(PlayerMailer).to have_received(:claim_offer_email).with(offer_player.player, offer_player.offer)
    end
  end
end
