class Api::V1::LocationsController < Api::ApiController
  before_action :authenticate

  def show
    json_response(LocationService.call(params[:country_code]))
  end
end
