class CreateTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups do |t|
      t.string :name
      t.string :external_id, null: false
      t.string :secret_code
      t.integer :parent_id
      t.references :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
    add_index(:target_groups, :external_id, unique: true)
    add_index(:target_groups, :panel_provider_id)
  end
end
