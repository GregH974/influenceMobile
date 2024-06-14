# Create offers table
class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.integer :score_to_achieve
      t.integer :min_age
      t.integer :max_age
      t.string :gender

      t.timestamps
    end
  end
end
