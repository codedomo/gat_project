class Country < ApplicationRecord
  belongs_to :panel_provider
  has_many :location_groups

  has_many :target_groups_countries, class_name: 'TargetGroupsCountry'
  has_many :target_groups, through: :target_groups_countries, join_table: "target_groups_countries"#, foreign_key: 'target_group_id'

  validates :code, presence: true, uniqueness: true
  validates :panel_provider, presence: true

  delegate :code, to: :panel_provider, prefix: true
end
