# Add roles
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: '0'
    remove_column :users, :age, :integer
    remove_column :users, :gender, :string
  end
end
