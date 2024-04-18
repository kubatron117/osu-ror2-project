class RodauthController < ApplicationController
  # used by Rodauth for rendering views, CSRF protection, and running any
  # registered action callbacks and rescue_from handlers
  before_action :authenticate, if: :require_authentication?
  # protect_from_forgery with: :null_session



  # private
  #
  def require_authentication?
     request.path.include?('/create-account')
  end
end
