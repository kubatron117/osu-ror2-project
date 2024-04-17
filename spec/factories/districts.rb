# spec/factories/districts.rb
FactoryBot.define do
  factory :district do
    name { "Default District" }
    code { "DIST001" }
    region
  end
end
