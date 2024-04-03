# Vytvoření regionů
praha = Region.create!(name: 'Hlavní město Praha', code: 'PRG')
jihomoravsky = Region.create!(name: 'Jihomoravský kraj', code: 'JHM')

# Vytvoření okresů
okres_praha = District.create!(name: 'Praha', code: 'PHA', region: praha)
okres_brno = District.create!(name: 'Brno-město', code: 'BM', region: jihomoravsky)

# Vytvoření SDH
sdh_praha = FireDepartment.create!(name: 'SDH Praha', code: 'SDHPRG', district: okres_praha, address: 'Náměstí Republiky 1, Praha')
sdh_brno = FireDepartment.create!(name: 'SDH Brno', code: 'SDHJHM', district: okres_brno, address: 'Zelný trh 8, Brno')

# Vytvoření účtů (předpokládá se, že hesla a další povinné polí pro autentizaci budou nastaveny jinde)
account_jan = Account.create!(first_name: 'Jan', last_name: 'Novák', birthdate: '1990-05-15', address: '', phone: '123456789', member_code: 'MN001', role: 'superadmin', email: 'jan@example.com', status: :verified, password: 'heslo123!')
account_anna = Account.create!(first_name: 'Anna', last_name: 'Svobodová', birthdate: '1985-03-22', address: '', phone: '987654321', member_code: 'MN002', role: 'nothing', email: 'anna@example.com', status: :verified, password: 'heslo123!')

# Vytvoření členství v SDH
FireDepartmentMembership.create!(start_date: Date.today, fire_department: sdh_praha, account: account_jan, role: 'admin', status: 'active')
FireDepartmentMembership.create!(start_date: Date.today - 1.year, fire_department: sdh_brno, account: account_anna, role: 'member', status: 'active')

# Vytvoření ocenění
award = Award.create!(name: 'Zlatá medaile za zásluhy', award_kind: :medal, minimum_service_years: 5, minimum_age_for_award: 30)
