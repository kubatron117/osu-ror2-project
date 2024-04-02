FactoryBot.define do
  factory :award do
    name { "MyString" }
    award_kind { 1 }
    dependent_on_award { 1 }
    minimum_service_years { 1 }
    minimum_age_for_award { 1 }
  end
end
