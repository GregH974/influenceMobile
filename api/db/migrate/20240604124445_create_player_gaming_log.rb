# Create player log table
class CreatePlayerGamingLog < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :player_gaming_logs do |t|
      t.references :player, null: false
      t.references :game, null: false
      t.jsonb :log

      t.timestamps
    end

    add_foreign_key :player_gaming_logs, :players, on_update: :cascade, name: :fk_player_gaming_logs_player_id,
                                                   on_delete: :cascade
    add_foreign_key :player_gaming_logs, :games, on_update: :cascade, name: :fk_player_gaming_logs_game_id,
                                                 on_delete: :nullify
  end
end
