class ChangePrimaryKeyInOfferPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_index :offer_players, column: [:offer_id, :player_id], unique: true

    # Set the composite primary key
    execute "ALTER TABLE offer_players ADD PRIMARY KEY (offer_id, player_id);"

    # Recreate any necessary indexes
    add_index :offer_players, :offer_id unless index_exists?(:offer_players, :offer_id)
    add_index :offer_players, :player_id unless index_exists?(:offer_players, :player_id)
  end
end
