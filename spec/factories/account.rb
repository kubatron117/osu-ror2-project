# spec/factories/accounts.rb
FactoryBot.define do
  factory :account do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    member_code { Faker::Alphanumeric.alphanumeric(number: 10) }
    role { %w[user admin superadmin].sample }
    status { Faker::Number.between(from: 1, to: 3) }
  end
end
