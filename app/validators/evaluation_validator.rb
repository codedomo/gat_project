class EvaluationValidator
  REQUIRED_PARAMS = %w(country_code target_group_id locations).freeze
  REQUIRED_LOCATIONS = %w(id panel_size).freeze

  def self.for(params)
    new(params)
  end


  def validate
    return params_diff     if params_diff
    return values_presence if values_presence
    false
  end

  private

  def initialize(params)
    @params = params
  end

  def params_diff
    errors = Array.new
    diff = REQUIRED_PARAMS - params.keys

    (return({ required: diff })) if diff.any?

    errors.push({ wrong_type: { location: 'array required' } }) unless params_locations.is_a?(Array)
    errors.push({ wrong_type: { location: 'array with hashes required' } }) unless !params_locations.respond_to?(:keys)

    params_locations.each do |location_hash|
      diff = REQUIRED_LOCATIONS - location_hash.keys
      (errors.push({ required: { locations: diff } }) && break) if diff.any?
    end

    return errors if errors.any?
    false
  end

  def values_presence
    attributes = Array.new

    if params[:country_code].empty? || !params[:country_code].instance_of?(String)
      attributes.push({ value_required: 'country_code', type: 'string' })
    end

    if !params[:target_group_id].present? || !params[:target_group_id].is_number?
      attributes.push({ value_required: 'target_group_id', type: 'integer' })
    end

    params_locations.each do |location_hash|
      location_hash.each do |key, value|
        if !value.is_number?
          (attributes.push({ value_required: { locations: key, type: 'integer' } }) && break)
        end
      end
    end

    (return attributes) if attributes.any?
    false
  end

  def params_locations
    @params_locations ||= (params[:locations] || []).delete_if(&:empty?)
  end

  attr_reader :params
end
