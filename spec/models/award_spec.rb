# spec/models/award_spec.rb
require 'rails_helper'

RSpec.describe Award, type: :model do
  it { should belong_to(:dependent_on_award).class_name('Award').optional }
  it { should have_one_attached(:image) }
  it { should have_many(:account_awards) }

  it { should define_enum_for(:award_kind).with_values(acknowledgement: 0, medal: 1, magnitude: 2) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should validate_presence_of(:award_kind) }
  it { should validate_numericality_of(:minimum_service_years).is_greater_than_or_equal_to(0).only_integer }
  it { should validate_numericality_of(:minimum_age_for_award).is_greater_than_or_equal_to(0).only_integer }
end