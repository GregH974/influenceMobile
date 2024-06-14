class PlayerMailer < ApplicationMailer
  helper :players

  def claim_offer_email(player, offer)
    @player = player
    @offer = offer

    mail(to: player.user.email, subject: I18n.t('email.offer.title'))
  end
end
