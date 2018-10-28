class Api::TargetsController < Api::ApiController
  before_action :authenticate_private

  def create
    json_response(EvaluationService.call(target_params))
  end

  private

  def target_params
    params.permit(:country_code, :target_group_id, locations: [:id, :panel_size])
  end
end
