class FireDepartmentMembershipsController < ApplicationController
  load_and_authorize_resource
  before_action :set_fire_department_membership, only: %i[ show edit update destroy ]

  # GET /fire_department_memberships or /fire_department_memberships.json
  def index
    @q = FireDepartmentMembership.ransack(params[:q])
    # @fire_department_memberships = @q.result.page(params[:page])
    @fire_department_memberships = @q.result.includes(:fire_department, :account).accessible_by(current_ability).page(params[:page])
  end

  # GET /fire_department_memberships/1 or /fire_department_memberships/1.json
  def show
  end

  # GET /fire_department_memberships/new
  def new
    @fire_department_membership = FireDepartmentMembership.new
  end

  # GET /fire_department_memberships/1/edit
  def edit
  end

  # POST /fire_department_memberships or /fire_department_memberships.json
  def create
    @fire_department_membership = FireDepartmentMembership.new(fire_department_membership_params)

    respond_to do |format|
      if @fire_department_membership.save
        format.html { redirect_to fire_department_membership_url(@fire_department_membership), notice: "Fire department membership was successfully created." }
        format.json { render :show, status: :created, location: @fire_department_membership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fire_department_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fire_department_memberships/1 or /fire_department_memberships/1.json
  def update
    respond_to do |format|
      if @fire_department_membership.update(fire_department_membership_params)
        format.html { redirect_to fire_department_membership_url(@fire_department_membership), notice: "Fire department membership was successfully updated." }
        format.json { render :show, status: :ok, location: @fire_department_membership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fire_department_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fire_department_memberships/1 or /fire_department_memberships/1.json
  def destroy
    @fire_department_membership.destroy!

    respond_to do |format|
      format.html { redirect_to fire_department_memberships_url, notice: "Fire department membership was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_fire_department_membership
      @fire_department_membership = FireDepartmentMembership.find(params[:id])
    end

    def fire_department_membership_params
      params.require(:fire_department_membership).permit(:start_date, :fire_department_id, :account_id, :role, :status)
    end
end
