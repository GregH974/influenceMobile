class Game < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Callbacks ============================================================

  # == Relationships ========================================================
  has_many :players

  # == Validations ==========================================================
  validates :name, presence: true

  # == Scopes ===============================================================

  # == Instance Methods =====================================================

  # == Class Methods ========================================================
end
