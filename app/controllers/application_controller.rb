class ApplicationController < ActionController::Base

  protected

  def current_ability
    @current_ability ||= ::Ability.new(current_account)
  end

  private

  def current_account
    rodauth.rails_account
  end
  helper_method :current_account

  def authenticate
    rodauth.require_account
  end


  def authenticate_by_token
    token = ENV["API_SECRET_TOKEN"]

    authenticate_or_request_with_http_token do |received_token, options|
      ActiveSupport::SecurityUtils.secure_compare(received_token, token)
    end
  end
end
