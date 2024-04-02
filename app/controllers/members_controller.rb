class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  # GET /members
  def index
    @members = Account.all
  end

  # GET /members/:id
  def show
  end

  private

  def set_member
    @member = Account.find(params[:id])
  end
end
