# Create player table
class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age, null: false
      t.string :gender, null: false
      t.references :user, null: false

      t.timestamps
    end

    add_foreign_key :players, :users, on_update: :cascade, name: :fk_players_user_id, on_delete: :cascade
  end
end
