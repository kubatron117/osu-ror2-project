class FireDepartmentsController < ApplicationController
  before_action :set_fire_department, only: %i[ show edit update destroy ]

  # GET /fire_departments or /fire_departments.json
  def index
    @fire_departments = FireDepartment.all
  end

  # GET /fire_departments/1 or /fire_departments/1.json
  def show
  end

  # GET /fire_departments/new
  def new
    @fire_department = FireDepartment.new
  end

  # GET /fire_departments/1/edit
  def edit
  end

  # POST /fire_departments or /fire_departments.json
  def create
    @fire_department = FireDepartment.new(fire_department_params)

    respond_to do |format|
      if @fire_department.save
        format.html { redirect_to fire_department_url(@fire_department), notice: "Fire department was successfully created." }
        format.json { render :show, status: :created, location: @fire_department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fire_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fire_departments/1 or /fire_departments/1.json
  def update
    respond_to do |format|
      if @fire_department.update(fire_department_params)
        format.html { redirect_to fire_department_url(@fire_department), notice: "Fire department was successfully updated." }
        format.json { render :show, status: :ok, location: @fire_department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fire_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fire_departments/1 or /fire_departments/1.json
  def destroy
    @fire_department.destroy!

    respond_to do |format|
      format.html { redirect_to fire_departments_url, notice: "Fire department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fire_department
      @fire_department = FireDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fire_department_params
      params.require(:fire_department).permit(:name, :code, :district_id, :address)
    end
end
