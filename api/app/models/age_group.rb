class AgeGroup < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Callbacks ============================================================

  # == Relationships ========================================================
  has_many :offer_age_groups
  has_many :offers, through: :offer_age_groups

  # == Validations ==========================================================
  validates :min_age, presence: true, numericality: { other_than: 0 }
  validates :max_age, presence: true,  comparison: { greater_than: :min_age }

  # == Scopes ===============================================================

  # == Instance Methods =====================================================

  # == Class Methods ========================================================
end
