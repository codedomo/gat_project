class Api::V1::TargetGroupsController < Api::ApiController
  before_action :authenticate

  def show
    json_response(TargetGroupService.call(params[:country_code]))
  end
end
