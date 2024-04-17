require 'rails_helper'

RSpec.describe Api::V1::MembersController, type: :controller do
  let!(:member) { create(:account) }
  let(:valid_attributes) { { email: "new@example.com", first_name: "New", last_name: "User", member_code: "DEF456", role: "nothing", birthdate: "1990-01-01", phone: "0987654321", address: "456 Example Rd." } }
  let(:invalid_attributes) { { email: 'invalid@email.cc', first_name: "New", last_name: "User", member_code: "", role: "nothing", birthdate: "1990-01-01", phone: "0987654321", address: "456 Example Rd." } }

  before do
    request.headers['Authorization'] = "Token #{ENV['API_SECRET_TOKEN']}"
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: member.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Account" do
        expect {
          post :create, params: { member: valid_attributes }
        }.to change(Account, :count).by(1)
      end

      it "returns a created status" do
        post :create, params: { member: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
        it 'does not create a new Account' do
          post :create, params: {member: invalid_attributes}
          expect(response).to_not be_successful
          expect(response).to have_http_status(:unprocessable_entity)
        end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { first_name: "Updated" }
    }

    it "updates the requested member" do
      put :update, params: { id: member.id, member: new_attributes }
      member.reload
      expect(member.first_name).to eq("Updated")
    end

    it "returns a success response" do
      put :update, params: { id: member.id, member: new_attributes }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested member" do
      expect {
        delete :destroy, params: { id: member.id }
      }.to change(Account, :count).by(-1)
    end

    it "returns a success status" do
      delete :destroy, params: { id: member.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
