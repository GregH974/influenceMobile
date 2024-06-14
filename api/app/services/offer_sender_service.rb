# A service to send email offer for a player who claim an offer.
# For this example, we supposed we have access to the server
# and we set the cron job hourly.
class OfferSenderService
  def self.call
    new.call
  end

  def call
    OfferPlayer.where(email_send: false).order(player_id: :asc).each do |offer_player|
      send_offer_email(offer_player)
    end
  end

  private

    def send_offer_email(offer_player)
      SendOfferEmailJob.perform_now(offer_player)
    end
end
