class Location < ApplicationRecord
  validates :name, presence: true
  validates :external_id, presence: true, uniqueness: true
  validates :secret_code, presence: true

  has_many :location_groups
end
