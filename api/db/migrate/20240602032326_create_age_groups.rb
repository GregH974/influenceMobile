# Create age group table
class CreateAgeGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :age_groups do |t|
      t.integer :min_age, unsigned: true, null: false
      t.integer :max_age, unsigned: true, null: false

      t.timestamps
    end
  end
end
