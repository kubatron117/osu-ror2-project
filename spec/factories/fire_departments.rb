# spec/factories/fire_departments.rb
FactoryBot.define do
  factory :fire_department do
    name { "Default Fire Department" }
    code { "FD001" }
    district
  end
end
