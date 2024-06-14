# Create association between offer and player tables
class CreateOfferPlayers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :offers, :players, table_name: :offer_players do |t|
      t.index %i[offer_id player_id], unique: true
      t.timestamps
    end

    add_foreign_key :offer_players, :offers, name: :fk_offer_players_offers, on_update: :cascade, on_delete: :cascade
    add_foreign_key :offer_players, :players, name: :fk_offer_players_players, on_update: :cascade, on_delete: :cascade
  end
end
