# spec/factories/regions.rb
FactoryBot.define do
  factory :region do
    name { "Default Region" }
    code { "REG001" }
  end
end
