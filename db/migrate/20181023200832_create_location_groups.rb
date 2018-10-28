class CreateLocationGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :location_groups do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.references :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
    add_index(:location_groups, :country_id)
    add_index(:location_groups, :panel_provider_id)
  end
end
