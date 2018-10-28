class LocationService

  def self.call(param)
    new(param).call
  end

  def call
    result
  end

  private

  def initialize(param)
    @param = param
  end

  def country
    country = Country.find_by(code: param)
    raise ActiveRecord::RecordNotFound unless country
    country
  end

  def location_groups
    LocationGroup.includes(:country, :panel_provider).where(
                    countries: { code: param },
                    panel_providers: { code: country.panel_provider.code })
  end

  def result
    Location.where(name: location_groups.map(&:name))
  end

  attr_reader :param
end
