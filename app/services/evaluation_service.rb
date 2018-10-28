class EvaluationService

  def self.call(params, validator: EvaluationValidator)
    new(params, validator).call
  end

  def call
    return validate if validate
    calculate_price
  end

  private

  def calculate_price
    { price: { "#{@country.code}": Pricing::Price.for(@country.panel_provider_code) } }
  end

  def initialize(params, validator)
    @params = params
    @validator = validator
  end

  def validate
    errors = Array.new
    result = validator.for(params).validate
    errors.push(result) if result
    return errors if errors.any?
    country
    target_group_id
    locations
    false
  end

  def country
    @country = Country.find_by(code: params[:country_code])
    return { no_record: { country: { available: country_codes } } } unless @country
    @country
  end

  def target_group_id
    @target_group_id = TargetGroup.find_by(id: params[:target_group_id])
    return { no_record: :target_group } unless @target_group_id
    @target_group_id
  end

  def locations
    ids = params[:locations].map { |location| location[:id]}
    @locations = Location.find_by(ids)
    return { no_record: :loations } unless @locations
    @locations
  end

  def country_codes
    @countries ||= Country.pluck(:code)
  end

  attr_reader :params, :validator
end
