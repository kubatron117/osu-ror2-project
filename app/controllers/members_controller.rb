class MembersController < ApplicationController
  load_and_authorize_resource :class => "Account"
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  def index
    @q = Account.select(:id, :status, :email, :first_name, :last_name, :birthdate, :address,
                        :phone, :member_code, :role).ransack(params[:q])
    # @members = @q.result.page(params[:page])
    @members = @q.result.accessible_by(current_ability).page(params[:page])
  end

  # GET /members/:id
  def show
    @member = Account.find(params[:id])
    current_age = ((Time.zone.now - @member.birthdate.to_time) / 1.year.seconds).floor

    earliest_start_date = @member.fire_department_memberships.minimum(:start_date)
    service_years = earliest_start_date ? ((Time.zone.now - earliest_start_date.to_time) / 1.year.seconds).floor : 0

    @earned_awards = @member.awards
    @eligible_awards = Award.where('minimum_age_for_award <= ?', current_age)
                            .where.not(id: @earned_awards.select(:id))
                            .reject do |award|
      needs_dependent_award = award.dependent_on_award_id.present? && !@earned_awards.exists?(award.dependent_on_award_id)
      needs_more_service = award.minimum_service_years.present? && award.minimum_service_years > service_years
      needs_dependent_award || needs_more_service
    end

    @fire_department_memberships = @member.fire_department_memberships.includes(:fire_department)
    # authorize! :read, @member
    # authorize! :read, @earned_awards
    # authorize! :read, @earned_awards
    # authorize! :read, @eligible_awards
    # authorize! :read, @fire_department_memberships
  end

  def edit
    # authorize! :edit, @member
  end

  # PUT /members/:id
  def update
    puts member_update_params.inspect
    if @member.update(member_update_params)
      redirect_to members_url(@member), notice: 'Člen byl úspěšně aktualizován.'
    else
      render :edit, status: :unprocessable_entity
    end
    # authorize! :update, @member
  end

  # DELETE /members/:id
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Člen byl úspěšně smazán.'
    # authorize! :destroy, @member
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

  def member_update_params
    params.require(:account).permit(:first_name, :last_name, :member_code, :role, :birthdate, :phone, :address)
  end
end
