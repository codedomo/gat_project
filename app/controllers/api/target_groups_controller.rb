class Api::TargetGroupsController < Api::ApiController
  before_action :authenticate_private

  def show
    json_response(TargetGroupService.call(params[:country_code]))
  end
end
