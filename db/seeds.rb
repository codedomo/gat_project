PANEL_PROVIDERS_CODES = %w[times_a 10_arrays times_html].freeze

COUNTRIES = [
  { code: "PL", panel_provider_code: "times_a" },
  { code: "US", panel_provider_code: "10_arrays" },
  { code: "UK", panel_provider_code: "times_html" }
].freeze

LOCATIONS = [
  { name: "New York" },
  { name: "Los Angeles" },
  { name: "Chicago" },
  { name: "Houston" },
  { name: "Philadelphia" },
  { name: "Phoenix" },
  { name: "San Antonio" },
  { name: "San Diego" },
  { name: "Dallas" },
  { name: "San Jose" },
  { name: "Austin" },
  { name: "Jacksonville" },
  { name: "San Francisco" },
  { name: "Indianapolis" },
  { name: "Columbus" },
  { name: "Fort Worth" },
  { name: "Charlotte" },
  { name: "Detroit" },
  { name: "El Paso" },
  { name: "Seattle" }
].freeze

PANEL_PROVIDERS_CODES.each { |panel_provider_code| PanelProvider.create!(code: panel_provider_code) }

COUNTRIES.each do |country|
  Country.create!(
    code: country.fetch(:code),
    panel_provider: PanelProvider.find_by!(code: country.fetch(:panel_provider_code))
  )
end

LOCATIONS.each do |location|
  Location.create!(
    name: location.fetch(:name),
    external_id: SecureRandom.uuid,
    secret_code: SecureRandom.hex(64)
  )
end

LocationGroup.create!(name: Location.first.name, country_id: Country.first.id, panel_provider_id: PanelProvider.first.id)
LocationGroup.create!(name: Location.second.name, country_id: Country.second.id, panel_provider_id: PanelProvider.second.id)
LocationGroup.create!(name: Location.third.name, country_id: Country.third.id, panel_provider_id: PanelProvider.third.id)
LocationGroup.create!(name: Location.fourth.name, country_id: Country.first.id, panel_provider_id: PanelProvider.first.id)

%w(TargetGroup1 TargetGroup2 TargetGroup3 TargetGroup4).each do |name|
  t1 = TargetGroup.create!(name: name, external_id: SecureRandom.uuid, secret_code: SecureRandom.hex(64), parent_id: nil, panel_provider_id: PanelProvider.first.id)
  t2 = TargetGroup.create!(name: name, external_id: SecureRandom.uuid, secret_code: SecureRandom.hex(64), parent_id: t1.id, panel_provider_id: PanelProvider.second.id)
  t3 = TargetGroup.create!(name: name, external_id: SecureRandom.uuid, secret_code: SecureRandom.hex(64), parent_id: t2.id, panel_provider_id: PanelProvider.third.id)
  t4 = TargetGroup.create!(name: name, external_id: SecureRandom.uuid, secret_code: SecureRandom.hex(64), parent_id: t3.id, panel_provider_id: PanelProvider.first.id)
end
