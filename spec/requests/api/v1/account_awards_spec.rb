require 'rails_helper'

RSpec.describe Api::V1::AccountAwardsController, type: :controller do
  let(:account) { FactoryBot.create(:account) }
  let(:award) { FactoryBot.create(:award) }
  let!(:account_award) { FactoryBot.create(:account_award, account: account, award: award) }

  before do
    allow(controller).to receive(:authenticate_by_token).and_return(true)
  end

  describe "GET #show" do
    context "when account exists" do
      it "returns http success and awards list" do
        get :show, params: { account_id: account.id }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response['awards']).to include(JSON.parse(award.to_json))
      end
    end

    context "when account does not exist" do
      it "returns http not found" do
        get :show, params: { account_id: 0 }

        expect(response).to have_http_status(:not_found)
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Account not found')
      end
    end
  end
end
