class Player < ApplicationRecord
  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Callbacks ============================================================

  # == Relationships ========================================================
  belongs_to :user
  belongs_to :gender
  has_many :player_gaming_logs
  has_many :offer_players
  has_many :offers, through: :offer_players

  # == Validations ==========================================================
  validates :age, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 18 }

  # == Scopes ===============================================================

  # == Instance Methods =====================================================

  # == Class Methods ========================================================

  def targeted_offers
    puts "targeted_offers age: #{age}, and gender #{gender.id}"
    age_group = AgeGroup.find_by('min_age <= ? AND max_age >= ?', age, age)

    # Offer.includes(:offer_age_groups).includes(:offer_genders).where(offer_age_groups: { age_group: }).where(offer_genders: { gender: })
    Offer.joins(:offer_age_groups, :offer_genders)
         .where(offer_age_groups: { age_group_id: age_group.id })
         .where(offer_genders: { gender_id: gender.id })
  end
end
