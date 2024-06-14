class Offer < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Callbacks ============================================================

  # == Relationships ========================================================
  has_many :offer_age_groups
  has_many :age_groups, through: :offer_age_groups

  has_many :offer_genders
  has_many :genders, through: :offer_genders

  has_many :offer_players
  has_many :players, through: :offer_players

  # == Validations ==========================================================
  validates :title, presence: true
  validates :description, presence: true
  validates :score_to_achieve, presence: true

  # == Scopes ===============================================================

  # == Instance Methods =====================================================

  # == Class Methods ========================================================
end
