class TargetGroup < ApplicationRecord
  belongs_to :parent, class_name: 'TargetGroup', foreign_key: :parent_id, optional: true
  has_many :children, class_name: 'TargetGroup', foreign_key: :parent_id

  has_many :target_groups_countries, class_name: 'TargetGroupsCountry'
  has_many :countries, through: :target_groups_countries, join_table: "target_groups_countries"
  belongs_to :panel_provider
end
