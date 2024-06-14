# Create offer age group table
class CreateOfferAgeGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :offers, :age_groups, table_name: :offer_age_groups do |t|
      t.index %i[offer_id age_group_id], unique: true
      t.timestamps
    end

    add_foreign_key :offer_age_groups, :offers, name: :fk_offer_age_groups_offers, on_update: :cascade,
                                                on_delete: :cascade
    add_foreign_key :offer_age_groups, :age_groups, name: :fk_offer_age_groups_age_groups, on_update: :cascade,
                                                    on_delete: :cascade
  end
end
