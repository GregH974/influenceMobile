# Create association between offer and gender tables
class CreateOfferGenders < ActiveRecord::Migration[7.0]
  def change
    create_join_table :offers, :genders, table_name: :offer_genders do |t|
      t.index %i[offer_id gender_id], unique: true
      t.timestamps
    end

    add_foreign_key :offer_genders, :offers, name: :fk_offer_genders_offers, on_update: :cascade, on_delete: :cascade
    add_foreign_key :offer_genders, :genders, name: :fk_offer_genders_genders, on_update: :cascade, on_delete: :cascade
  end
end
