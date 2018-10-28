class TargetGroupsCountry < ApplicationRecord
  belongs_to :country
  belongs_to :target_group

  validate :ensure_root

  private

  def ensure_root
    if self.target_group.parent_id.present?
      errors.add(:parent_id, 'parent only')
    end
  end
end
