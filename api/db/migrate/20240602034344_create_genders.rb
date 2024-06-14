# Create gender table
class CreateGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :genders do |t|
      t.string :name

      t.timestamps
    end

    remove_column :players, :gender, :string
    add_reference :players, :gender, foreign_key: true, null: false
  end
end
