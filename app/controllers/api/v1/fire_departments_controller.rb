class Api::V1::FireDepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_by_token
  before_action :set_fire_department, only: %i[ show ]

  # GET /fire_departments
  def index
    @q = FireDepartment.all.ransack(params[:q])
    @fire_departments = @q.result
    render json: { fire_departments: @fire_departments}
  end

  # GET /fire_departments/1
  def show
    render json: @fire_department
  end

  private

    def set_fire_department
      @fire_department = FireDepartment.find(params[:id])
    end

    def fire_department_params
      params.require(:fire_department).permit(:name, :code, :district_id, :address)
    end
end
