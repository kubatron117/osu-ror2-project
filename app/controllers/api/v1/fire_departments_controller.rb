class Api::V1::FireDepartmentsController < ApplicationController
  before_action :authenticate #TODO: move token methon into one place
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

  def authenticate
    token = ENV["API_SECRET_TOKEN"]

    authenticate_or_request_with_http_token do |received_token, options|
      ActiveSupport::SecurityUtils.secure_compare(received_token, token)
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_fire_department
      @fire_department = FireDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fire_department_params
      params.require(:fire_department).permit(:name, :code, :district_id, :address)
    end
end
