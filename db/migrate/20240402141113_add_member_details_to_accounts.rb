class AddMemberDetailsToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :birthdate, :date
    add_column :accounts, :address, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :member_code, :string
    add_column :accounts, :role, :integer
  end
end
