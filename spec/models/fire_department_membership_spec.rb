# spec/models/fire_department_membership_spec.rb
require 'rails_helper'

RSpec.describe FireDepartmentMembership, type: :model do
  it { should belong_to(:fire_department) }
  it { should belong_to(:account) }

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:role) }
  it { should validate_inclusion_of(:role).in_array(FireDepartmentMembership.roles.keys) }
  it { should validate_presence_of(:status) }
  it { should validate_inclusion_of(:status).in_array(FireDepartmentMembership.statuses.keys) }

  describe 'custom validations' do
    let(:account) { create(:account) }
    let(:fire_department) { create(:fire_department) }
    let(:membership) { build(:fire_department_membership, account: account, fire_department: fire_department, status: 'active') }

    context 'when an account has an active membership' do
      before do
        create(:fire_department_membership, account: account, fire_department: fire_department, status: 'active')
      end

      it 'is invalid if another active membership exists' do
        expect(membership.valid?).to be false
        expect(membership.errors[:account_id]).to include("can't have more than one active membership")
      end
    end

    context 'when an account does not have an active membership' do
      it 'is valid if no active membership exists' do
        expect(membership.valid?).to be true
      end
    end
  end
end
