# spec/models/award_spec.rb
require 'rails_helper'

RSpec.describe Award, type: :model do
  it { should have_and_belong_to_many(:accounts) }
  it { should belong_to(:dependent_on_award).class_name('Award').optional }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should validate_presence_of(:award_kind) }
  it { should validate_inclusion_of(:award_kind).in_array(Award.award_kinds.keys) }
  it { should validate_presence_of(:minimum_service_years) }
  it { should validate_numericality_of(:minimum_service_years).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:minimum_age_for_award) }
  it { should validate_numericality_of(:minimum_age_for_award).is_greater_than_or_equal_to(0) }
end
