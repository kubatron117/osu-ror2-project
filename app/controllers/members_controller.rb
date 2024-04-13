class MembersController < ApplicationController
  before_action :set_member, only: [:show]

  # GET /members
  def index
    @q = Account.select(:id, :status, :email, :first_name, :last_name, :birthdate, :address,
                        :phone, :member_code, :role).ransack(params[:q])
    @members = @q.result.page(params[:page])
    #TODO: role not selecting
  end

  # GET /members/:id
  def show
  end

  # POST /members
  # def create
  #   ActiveRecord::Base.transaction do
  #     RodauthApp.rodauth.create_account(login: member_params[:email])
  #     account = Account.find_by(email: member_params[:email])
  #     if account.update(member_params.except(:email))
  #       render json: { message: "User created successfully. Verification email has been sent." }, status: :created
  #     else
  #       render json: { error: account.errors.full_messages }, status: :unprocessable_entity
  #       raise ActiveRecord::Rollback
  #     end
  #   end
  # end

  private

  def set_member
    @member = Account.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end
end
