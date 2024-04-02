FactoryBot.define do
  factory :fire_department_membership do
    start_date { "2024-04-02" }
    fire_department { nil }
    member { nil }
    role { 1 }
    status { 1 }
  end
end
