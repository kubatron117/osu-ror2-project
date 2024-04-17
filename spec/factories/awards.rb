FactoryBot.define do
  factory :award do
    name { "Test award" }
    award_kind { 1 }
    dependent_on_award_id { 0 }
    minimum_service_years { 0 }
    minimum_age_for_award { 0 }
  end
end
