require 'rails_helper'

RSpec.describe FireDepartment, type: :model do
  describe 'associations' do
    it { should belong_to(:district) }
    it { should have_many(:fire_department_memberships).dependent(:restrict_with_error) }
    it { should have_many(:accounts).through(:fire_department_memberships).dependent(:restrict_with_error) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }

    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code).case_insensitive }
    it { should validate_length_of(:code).is_at_most(10) }

    it { should validate_presence_of(:address) }
    it { should validate_length_of(:address).is_at_most(255) }

    it { should validate_presence_of(:district_id) }
    it { should validate_numericality_of(:district_id).is_greater_than_or_equal_to(0).only_integer }
  end

  describe 'callbacks' do
    it 'upcases the code before validation' do
      fire_department = FireDepartment.new(code: 'abc123', name: 'Fire Station', address: '123 Main St', district_id: 1)
      fire_department.valid?
      expect(fire_department.code).to eq('ABC123')
    end
  end

  describe 'class methods' do
    it 'returns ransackable attributes' do
      expect(FireDepartment.ransackable_attributes).to eq(["code", "name", "address", "district_id"])
    end
  end
end