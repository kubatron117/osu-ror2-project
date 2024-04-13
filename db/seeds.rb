# db/seeds.rb
require 'faker'

regions_data = [
  { name: 'Hlavní město Praha', code: 'PRG' },
  { name: 'Jihomoravský kraj', code: 'JHM' },
  { name: 'Jihočeský kraj', code: 'JHC' },
  { name: 'Vysočina', code: 'VYS' },
  { name: 'Karlovarský kraj', code: 'KVK' },
  { name: 'Královéhradecký kraj', code: 'KHK' },
  { name: 'Liberecký kraj', code: 'LBK' },
  { name: 'Moravskoslezský kraj', code: 'MSK' },
  { name: 'Olomoucký kraj', code: 'OLK' },
  { name: 'Pardubický kraj', code: 'PAK' },
  { name: 'Plzeňský kraj', code: 'PLK' },
  { name: 'Středočeský kraj', code: 'STC' },
  { name: 'Ústecký kraj', code: 'ULK' },
  { name: 'Zlínský kraj', code: 'ZLK' }
]

regions = regions_data.map do |region|
  Region.create!(name: region[:name], code: region[:code])
end

FireDepartment.destroy_all
regions.each do |region|
  3.times do |i|
    district = District.create!(name: "#{region.name} Okres #{i + 1}", code: "#{region.code}#{i + 1}", region: region)
    2.times do |j|
      FireDepartment.create!(name: "SDH #{district.name} Jednotka #{j + 1}", code: "#{district.code}#{j + 1}", district: district, address: Faker::Address.street_address)
    end
  end
end

20.times do
  Account.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.between(from: '1970-01-01', to: '2000-01-01'),
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    member_code: Faker::Lorem.unique.characters(number: 6),
    role: Account.roles.keys.sample,
    email: Faker::Internet.unique.email,
    status: Account.statuses.keys.sample,
    password: 'heslo123!'
  )
end

Account.all.each do |account|
  fire_department = FireDepartment.order(Arel.sql('RANDOM()')).first
  FireDepartmentMembership.create!(
    start_date: Faker::Date.backward(days: 365 * rand(1..5)),
    fire_department: fire_department,
    account: account,
    role: FireDepartmentMembership.roles.keys.sample,
    status: FireDepartmentMembership.statuses.keys.sample
  )
end

5.times do |i|
  award = Award.create!(
    name: "Ocenění #{i + 1}",
    award_kind: Award.award_kinds.keys.sample,
    dependent_on_award_id: nil,
    minimum_service_years: rand(1..10),
    minimum_age_for_award: rand(18..50)
  )
  Account.all.sample(5).each do |account|
    AccountAward.create!(account: account, award: award)
  end
end
