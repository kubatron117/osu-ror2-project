require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should have_many(:fire_department_memberships).dependent(:destroy) }
  it { should have_many(:fire_departments).through(:fire_department_memberships) }
  it { should have_many(:account_awards).dependent(:destroy) }
  it { should have_many(:awards).through(:account_awards) }

  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_most(70) }

  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_most(70) }

  it { should validate_presence_of(:birthdate) }

  it { should validate_length_of(:address).is_at_most(255) }
  it { should allow_value("").for(:address) }

  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:phone).case_insensitive }

  it { should validate_presence_of(:member_code) }
  it { should validate_uniqueness_of(:member_code) }

  it { should validate_presence_of(:role) }

  it { should define_enum_for(:status).with_values(unverified: 1, verified: 2, closed: 3) }
  it { should define_enum_for(:role).with_values(nothing: 0, superadmin: 1) }

  describe "#full_name" do
    it "returns the concatenation of first name and last name" do
      account = Account.new(first_name: "John", last_name: "Doe")
      expect(account.full_name).to eq("John Doe")
    end
  end

  describe "enum for role" do
    it "should define the correct enum values" do
      is_expected.to define_enum_for(:role).with_values(nothing: 0, superadmin: 1).backed_by_column_of_type(:integer)
    end

    it "does not allow invalid roles" do
      expect { Account.new(role: 'invalid_role') }.to raise_error(ArgumentError)
    end
  end
end
