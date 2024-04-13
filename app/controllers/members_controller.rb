class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_member, only: [:show]

  # GET /members
  def index
    @members = Account.all
  end

  # GET /members/:id
  def show
  end

  # POST /members
  def create
    ActiveRecord::Base.transaction do
      RodauthApp.rodauth.create_account(login: member_params[:email])
      account = Account.find_by(email: member_params[:email])
      if account.update(member_params.except(:email))
        render json: { message: "User created successfully. Verification email has been sent." }, status: :created
      else
        render json: { error: account.errors.full_messages }, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  private

  def set_member
    @member = Account.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end
end
