class Api::V1::AccountAwardsController < ApplicationController
  before_action :authenticate_by_token
  before_action :set_account, only: [:show]

  # GET /api/v1/account_awards/:account_id
  def show
    if @account
      awards = @account.awards
      render json: { awards: awards }
    else
      render json: { error: 'Account not found' }, status: :not_found
    end
  end

  private

  def set_account
    @account = Account.find_by(id: params[:account_id])
    puts @account.inspect
  end
end
