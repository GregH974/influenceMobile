# Add age and gender fields
class AddAgeAndGenderToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer, after: :email, null: true
    add_column :users, :gender, :string, limit: 20, after: :age, null: true
  end
end
