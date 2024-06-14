class AddSendToOfferPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :offer_players, :email_send, :boolean, default: false, null: false
  end
end
