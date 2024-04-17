# spec/factories/fire_department_memberships.rb
FactoryBot.define do
  factory :fire_department_membership do
    fire_department
    account
    start_date { Date.today }
    role { :member }  # Ensure only valid roles are used
    status { :active }  # Ensure only valid statuses are used
  end
end

