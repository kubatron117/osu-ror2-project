# spec/factories/accounts.rb
FactoryBot.define do
  factory :account do
    first_name { "John" }
    last_name { "Doe" }
    email { "john.doe@example.com" }
    birthdate { "1980-01-01" }
    phone { "1234567890" }
    address { "123 Main St" }
    member_code { "ABC123" }
    role { "nothing" }
    status { 1 }
  end
end
