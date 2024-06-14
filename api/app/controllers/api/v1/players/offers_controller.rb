class Api::V1::Players::OffersController < Api::V1::Players::BaseController
  before_action :set_player, only: [:edit, :claim]

  # GET /api/v1/players/offers
  def index
    player = Player.find_by(user_id: current_user.id)

    if player.blank?
      render json: { offers: nil }, status: :not_found
    else
      claim_offers = player.offers
      offers = player.targeted_offers - claim_offers
      total_score = PlayerGamingLog.total_score(player.id)

      render json: {
        claim_offers: claim_offers,
        offers: offers,
        total_score: total_score
      }, status: :ok
    end
  end

  # PATCH/PUT /api/v1/players/offers/edit
  def edit
    if @player.blank?
      render json: { error: 'Player not found' }, status: :not_found
    else
      claim_offers = @player.offers
      offers = @player.targeted_offers - claim_offers
      total_score = PlayerGamingLog.total_score(@player.id)

      render json: {
        claim_offers: claim_offers,
        offers: offers,
        total_score: total_score
      }, status: :ok
    end
  end

  # PATCH/PUT /api/v1/players/offers/claim
  def claim
    offer = find_offer

    if offer.blank?
      render json: { error: 'Offer not found' }, status: :not_found
    elsif @player.blank?
      render json: { error: 'Player not found' }, status: :not_found
    elsif can_claim_offer?(@player, offer)
      claim_offer(@player, offer)
      render json: { message: I18n.t('player_offer.claim') }, status: :ok
    else
      render json: { error: I18n.t('player_offer.can_not_claim') }, status: :unprocessable_entity
    end
  end

  private

    def claim_params
      params.require(:format)
    end

    def find_offer
      Offer.find_by(id: claim_params)
    end

    def set_player
      @player = current_user.players&.first
    end

    def can_claim_offer?(player, offer)
      player.targeted_offers.present? && player.targeted_offers.pluck(:id).include?(offer.id)
    end

    def claim_offer(player, offer)
      player.offers << offer
    end
end

