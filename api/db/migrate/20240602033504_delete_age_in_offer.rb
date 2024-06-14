# Remove useless fields in offer table
class DeleteAgeInOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :min_age, :integer
    remove_column :offers, :max_age, :integer
    remove_column :offers, :gender, :string
  end
end
