json.extract! member, :id, :first_name, :last_name, :birthdate, :address, :email, :phone, :member_code, :role, :created_at, :updated_at
json.url member_url(member, format: :json)
