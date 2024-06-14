class PlayerGamingLog < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Callbacks ============================================================

  # == Relationships ========================================================
  belongs_to :player
  belongs_to :game

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Instance Methods =====================================================
  def self.total_score(player_id)
    return 0 if player_id.blank?

    score = select("player_id, SUM((log->>'score')::int) AS total_score")
            .where(player_id:)
            .group(:player_id)
            .map { |log| { player_id: log.player_id, total_score: log.total_score.to_i } }

    return 0 if score.blank?

    score.first[:total_score]
  end

  # == Class Methods ========================================================
end
