class RodauthController < ApplicationController
  # used by Rodauth for rendering views, CSRF protection, and running any
  # registered action callbacks and rescue_from handlers
  before_action :authenticate, unless: :skip_authentication?
  protect_from_forgery with: :null_session



  private

  def authenticate
    token = ENV["API_SECRET_TOKEN"]

    authenticate_or_request_with_http_token do |received_token, options|
      ActiveSupport::SecurityUtils.secure_compare(received_token, token)
    end
  end

  def skip_authentication?
    request.path.include?('/verify-account')
  end
end
