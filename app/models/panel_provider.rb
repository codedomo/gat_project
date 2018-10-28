class PanelProvider < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  def price
    Pricing::Price.for(self.code)
  end
end
