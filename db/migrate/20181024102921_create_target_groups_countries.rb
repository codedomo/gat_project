class CreateTargetGroupsCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups_countries do |t|
      t.references :target_group, foreign_key: true
      t.references :country, foreign_key: true
    end
  end
end
