require 'rails_helper'

RSpec.describe FireDepartmentMembership, type: :model do
  # Test associations
  describe 'associations' do
    it { should belong_to(:fire_department) }
    it { should belong_to(:account) }
  end

  # Test validations
  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:fire_department_id) }
    it { should validate_numericality_of(:fire_department_id).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_presence_of(:account_id) }
    it { should validate_numericality_of(:account_id).is_greater_than_or_equal_to(0).only_integer }
  end

  # Test custom validations
  describe 'custom validations' do
    let(:account) do
      Account.create!(
        first_name: 'John',
        last_name: 'Doe',
        birthdate: Date.new(1990, 1, 1),
        phone: '123456789',
        email: 'john@doeee.com',
        member_code: 'ABC123',
        role: 'nothing'
      )
    end
    let(:fire_department) { FireDepartment.create!(name: 'Test Department', code: 'AHA123', address: 'add 123', district_id: 1) }

    it 'validates that only one active membership per account is allowed' do
      existing_membership = FireDepartmentMembership.create!(account: account, fire_department: fire_department, start_date: Date.today, status: 'active', role: 'member')
      new_membership = FireDepartmentMembership.new(account: account, fire_department: fire_department, start_date: Date.today, status: 'active', role: 'member')

      expect(new_membership.valid?).to be false
      expect(new_membership.errors[:account_id]).to include("can't have more than one active membership")
    end
  end
end
