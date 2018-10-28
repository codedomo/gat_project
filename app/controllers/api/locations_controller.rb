class Api::LocationsController < Api::ApiController
  before_action :authenticate_private

  def show
    json_response(LocationService.call(params[:country_code]))
  end
end
