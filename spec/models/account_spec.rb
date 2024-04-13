require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:fire_department_memberships).dependent(:destroy) }
    it { is_expected.to have_many(:fire_departments).through(:fire_department_memberships) }
    it { is_expected.to have_and_belong_to_many(:awards) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(70) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(70) }
    it { is_expected.to validate_presence_of(:birthdate) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_uniqueness_of(:phone) }
    it { is_expected.to validate_presence_of(:member_code) }
    it { is_expected.to validate_uniqueness_of(:member_code) }
    it { is_expected.to validate_presence_of(:role) }
  end
end
