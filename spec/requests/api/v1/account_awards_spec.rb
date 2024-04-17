require 'rails_helper'

RSpec.describe Api::V1::AccountAwardsController, type: :controller do
  let(:award) { FactoryBot.create(:award) }

  before do
    allow(controller).to receive(:authenticate_by_token).and_return(true)
  end

  describe "GET #show" do
    context "when account exists" do
      let(:account) { FactoryBot.create(:account) }
      let(:prerequisite_award) { FactoryBot.create(:award, dependent_on_award_id: nil) }
      let(:independent_award) { FactoryBot.create(:award, dependent_on_award_id: prerequisite_award.id) }

      before do
        account.awards << prerequisite_award
        account.awards << independent_award
        get :show, params: { account_id: account.id }
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns the account's awards" do
        json_response = JSON.parse(response.body)
        expect(json_response['awards']).to include(JSON.parse(independent_award.to_json))
      end
    end

    context "when account does not exist" do
      before do
        get :show, params: { account_id: 0 }
      end

      it "returns http not found" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns an error message" do
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Account not found')
      end
    end
  end
end