# spec/models/fire_department_spec.rb
require 'rails_helper'

RSpec.describe FireDepartment, type: :model do
  it { should belong_to(:district) }
  it { should have_many(:fire_department_memberships).dependent(:destroy) }
  it { should have_many(:accounts).through(:fire_department_memberships) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
  it { should validate_presence_of(:address) }
end
