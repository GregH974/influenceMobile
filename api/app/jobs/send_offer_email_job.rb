class SendOfferEmailJob < ApplicationJob
  queue_as :default

  def perform(offer_player)
    send_email(offer_player)
    update_email_send(offer_player)
  end

  private

    def send_email(offer_player)
      PlayerMailer.claim_offer_email(offer_player.player, offer_player.offer).deliver_now
    end

    def update_email_send(offer_player)
      offer_player.update(email_send: true)
    end
end
