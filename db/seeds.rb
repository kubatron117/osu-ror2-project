# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# Vytvoření kraje
praha = Region.create!(name: 'Hlavní město Praha', code: 'PRG')
jihomoravsky = Region.create!(name: 'Jihomoravský kraj', code: 'JHM')

# Vytvoření okresů
okres_praha = District.create!(name: 'Praha', code: 'PHA', region: praha)
okres_brno = District.create!(name: 'Brno-město', code: 'BM', region: jihomoravsky)

# Vytvoření SDH
sdh_praha = FireDepartment.create!(name: 'SDH Praha', code: 'SDHPRG', district: okres_praha, address: 'Náměstí Republiky 1, Praha')
sdh_brno = FireDepartment.create!(name: 'SDH Brno', code: 'SDHJHM', district: okres_brno, address: 'Zelný trh 8, Brno')

# Vytvoření členů
member_jan = Member.create!(first_name: 'Jan', last_name: 'Novák', birthdate: '1990-05-15', email: 'jan.novak@example.com', phone: '123456789', member_code: 'MN001', role: 0)
member_anna = Member.create!(first_name: 'Anna', last_name: 'Svobodová', birthdate: '1985-03-22', email: 'anna.svobodova@example.com', phone: '987654321', member_code: 'MN002', role: 1)

# Vytvoření členství v SDH
FireDepartmentMembership.create!(start_date: Date.today, fire_department: sdh_praha, member: member_jan, status: 'active')
FireDepartmentMembership.create!(start_date: Date.today - 1.year, fire_department: sdh_brno, member: member_anna, status: 'active')

# Vytvoření ocenění
award_medal = Award.create!(name: 'Medaile za zásluhy', award_kind: 'medal', minimum_service_years: 5, minimum_age_for_award: 30)
