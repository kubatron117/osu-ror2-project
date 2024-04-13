require 'rails_helper'

RSpec.describe AddAwardToMemberService, type: :service do
  describe 'validations' do
    it { should validate_presence_of(:account_id) }
    it { should validate_presence_of(:award_id) }

    it 'validates the existence of the account' do
      service = AddAwardToMemberService.new(account_id: 1, award_id: 2)
      allow(Account).to receive(:exists?).with(1).and_return(false)
      service.valid?
      expect(service.errors[:account_id]).to include('is invalid')
    end

    it 'validates the existence of the award' do
      service = AddAwardToMemberService.new(account_id: 1, award_id: 2)
      allow(Award).to receive(:exists?).with(2).and_return(false)
      service.valid?
      expect(service.errors[:award_id]).to include('is invalid')
    end
  end

  describe '#call' do
    let(:account) { FactoryBot.create(:account) }
    let(:award) { FactoryBot.create(:award) }

    context 'with valid parameters' do
      it 'creates an AccountAward successfully' do
        service = AddAwardToMemberService.new(account_id: account.id, award_id: award.id)
        expect { service.call }.to change(AccountAward, :count).by(1)
        expect(service).to be_truthy
      end
    end

    context 'with invalid parameters' do
      it 'does not create an AccountAward and returns false' do
        service = AddAwardToMemberService.new(account_id: nil, award_id: nil)
        expect { service.call }.not_to change(AccountAward, :count)
        expect(service.call).to be_falsey
      end
    end

    context 'when the account or award does not exist' do
      it 'does not create an AccountAward and returns false' do
        allow(Account).to receive(:exists?).and_return(false)
        allow(Award).to receive(:exists?).and_return(false)
        service = AddAwardToMemberService.new(account_id: 999, award_id: 999)
        expect { service.call }.not_to change(AccountAward, :count)
        expect(service.call).to be_falsey
      end
    end
  end
end
