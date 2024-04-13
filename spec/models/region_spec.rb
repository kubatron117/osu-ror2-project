# spec/models/region_spec.rb
require 'rails_helper'

RSpec.describe Region, type: :model do
  it { should have_many(:districts) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
end
