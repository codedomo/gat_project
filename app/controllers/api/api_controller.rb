class Api::ApiController < ApplicationController
  include Response
  include ExceptionHandler
  skip_before_action :verify_authenticity_token

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      %w(ApiToken1 ApiToken2).include? token
    end
  end

  def authenticate_private
    authenticate_or_request_with_http_token do |token, options|
      %w(ApiToken1 ApiToken2).include? token
    end
  end
end
