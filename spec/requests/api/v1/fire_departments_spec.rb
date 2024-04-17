require 'rails_helper'

RSpec.describe Api::V1::FireDepartmentsController, type: :controller do
  let(:fire_department) { create(:fire_department) }

  before do
    authenticate_with_token
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: fire_department.to_param}
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  private

  # Helper method for authenticating with the API secret token
  def authenticate_with_token
    token = ENV["API_SECRET_TOKEN"]
    request.headers['Authorization'] = "Bearer #{token}"
  end

  def json_response
    JSON.parse(response.body)
  end
end
