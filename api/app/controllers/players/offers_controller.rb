module Players
  class OffersController < BaseController
    def edit
      @offers = nil
      @claim_offers = nil
      @total_scores = 0
      player = Player.find_by(user_id: current_user.id)

      return if player.blank?

      @claim_offers = player.offers
      @offers = player.targeted_offers - @claim_offers
      @total_score = PlayerGamingLog.total_score(player.id)
    end

    def claim
      offer = find_offer
      player = find_player

      if can_claim_offer?(player, offer)
        claim_offer(player, offer)

        redirect_to edit_players_offer_path, notice: I18n.t('player_offer.claim')
      else
        redirect_to edit_players_offer_path, notice: I18n.t('player_offer.can_not_claim')
      end
    end

    private

      def claim_params
        params.require(:format)
      end

      def find_offer
        Offer.find(claim_params)
      end

      def find_player
        current_user.players&.first
      end

      def can_claim_offer?(player, offer)
        player.targeted_offers.present? && player.targeted_offers.pluck(:id).include?(offer.id)
      end

      def claim_offer(player, offer)
        player&.offers&.<< offer
      end
  end
end
