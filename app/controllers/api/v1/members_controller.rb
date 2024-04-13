class Api::V1::MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @q = Account.select(:id, :status, :email, :first_name, :last_name, :birthdate, :address,
                        :phone, :member_code, :role).ransack(params[:q])
    @members = @q.result
    render json: { members: @members}
  end

  # GET /members/:id
  def show
    render json: @member
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

  # PUT /members/:id
  def update
      if @member.update(update_params)
        render json: { message: "User updated successfully." }, status: :ok
      else
        render json: { error: @member.errors.full_messages }, status: :unprocessable_entity
      end
  end

  # DELETE /members/:id
  def destroy
    if @member.destroy
      render json: { message: "Account successfully deleted." }, status: :ok
    else
      render json: { error: "Failed to delete the account." }, status: :unprocessable_entity
    end
  end

  private

  def set_member
    @member = Account.where(id: params[:id]).select(:id, :status, :email, :first_name, :last_name, :birthdate,
                                                    :address, :phone, :member_code, :role).first
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end

  def update_params
    params.require(:member).permit(:first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end
end
