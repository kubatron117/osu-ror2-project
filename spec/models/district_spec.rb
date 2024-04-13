# spec/models/district_spec.rb
require 'rails_helper'

RSpec.describe District, type: :model do
  it { should belong_to(:region) }
  it { should have_many(:fire_departments) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
end
