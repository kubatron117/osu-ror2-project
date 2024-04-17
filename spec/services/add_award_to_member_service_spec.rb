require 'rails_helper'

RSpec.describe AddAwardToMemberService, type: :service do
  describe '#call' do
    let(:account) { create(:account) }
    let(:award) { create(:award) }

    context 'with invalid account_id' do
      let(:service) { described_class.new(account_id: nil, award_id: award.id) }

      it 'does not create an AccountAward and adds an error' do
        expect { service.call }.not_to change { AccountAward.count }
        expect(service.call).to be false
        expect(service.errors.full_messages).to include("Account can't be blank")
      end
    end

    context 'when the account does not exist' do
      let(:service) { described_class.new(account_id: -1, award_id: award.id) }

      it 'does not create an AccountAward and adds an error' do
        expect { service.call }.not_to change { AccountAward.count }
        expect(service.call).to be false
        expect(service.errors.full_messages).to include("Account is invalid")
      end
    end

    context 'with invalid award_id' do
      let(:service) { described_class.new(account_id: account.id, award_id: nil) }

      it 'does not create an AccountAward and adds an error' do
        expect { service.call }.not_to change { AccountAward.count }
        expect(service.call).to be false
        expect(service.errors.full_messages).to include("Award can't be blank")
      end
    end

    context 'when the award does not exist' do
      let(:service) { described_class.new(account_id: account.id, award_id: -1) }

      it 'does not create an AccountAward and adds an error' do
        expect { service.call }.not_to change { AccountAward.count }
        expect(service.call).to be false
        expect(service.errors.full_messages).to include("Award is invalid")
      end
    end

    context 'when database operation fails' do
      let(:service) { described_class.new(account_id: account.id, award_id: award.id) }

      before do
        allow(AccountAward).to receive(:create!).and_raise(ActiveRecord::RecordInvalid.new(AccountAward.new))
      end

      it 'returns false and adds a base error' do
        expect(service.call).to be false
        expect(service.errors.full_messages).to include(match(/Failed to create AccountAward/))
      end
    end
  end
end