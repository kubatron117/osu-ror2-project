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

  # # POST /members
  # def create
  #   member_data = member_params
  #
  #   create_account_result = RodauthApp.rodauth.create_account(login: member_data[:email])
  #
  #   if create_account_result[:status] == 'success'
  #     account = Account.find_by(email: member_data[:email])
  #     if account.update(member_data.except(:email))
  #       render json: { message: "User created successfully. Verification email has been sent." }, status: :created
  #     else
  #       render json: { error: account.errors.full_messages }, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { error: create_account_result[:error] || "Failed to create user." }, status: :unprocessable_entity
  #   end
  # rescue => e
  #   render json: { error: e.message }, status: :internal_server_error
  # end

  private

  def set_member
    @member = Account.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end
end
