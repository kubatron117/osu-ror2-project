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
    member_data = member_params

    puts "Member data:"
    puts member_data.inspect
    # member_data[:birthdate] = Date.parse(member_data[:birthdate]) if member_data[:birthdate].present?

    ActiveRecord::Base.transaction do
      RodauthApp.rodauth.create_account(login: member_data[:email])
      account = Account.find_by(email: member_data[:email])
      if account.update(member_data.except(:email))
        render json: { message: "User created successfully. Verification email has been sent." }, status: :created
      else
        render json: { error: account.errors.full_messages }, status: :unprocessable_entity
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
