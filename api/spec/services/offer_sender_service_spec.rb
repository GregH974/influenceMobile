RSpec.describe OfferSenderService, type: :service do
  describe 'call service' do
    let!(:player) { create(:player) }
    let!(:offer) { create(:offer) }
    let!(:unsent_offer) { create(:offer_player, offer:, player:, email_send: false) }
    let!(:offer2) { create(:offer) }
    let!(:sent_offer) { create(:offer_player, offer: offer2, player:, email_send: true) }

    before do
      allow(SendOfferEmailJob).to receive(:perform_now).and_call_original
    end

    it 'with unsent offers, send email and update field' do
      described_class.call
      expect(SendOfferEmailJob).to have_received(:perform_now).with(unsent_offer)
      expect(unsent_offer.reload.email_send).to be(true)
    end

    it 'with already sent offers does not enqueue jobs' do
      described_class.call
      expect(SendOfferEmailJob).not_to have_received(:perform_now).with(sent_offer)
    end
  end
end
