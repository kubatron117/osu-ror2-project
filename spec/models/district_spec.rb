# spec/models/district_spec.rb
require 'rails_helper'

RSpec.describe District, type: :model do
  it { should belong_to(:region) }
  it { should have_many(:fire_departments).dependent(:restrict_with_error) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }

  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code).case_insensitive }
  it { should validate_length_of(:code).is_at_most(10) }

  it { should validate_presence_of(:region_id) }
  it { should validate_numericality_of(:region_id).is_greater_than_or_equal_to(0).only_integer }

  describe 'callbacks' do
    it 'converts code to uppercase before validation' do
      district = District.new(code: 'abcd1234')
      district.valid?
      expect(district.code).to eq('ABCD1234')
    end
  end
end
