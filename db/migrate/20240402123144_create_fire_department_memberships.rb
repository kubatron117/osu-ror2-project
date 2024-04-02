class CreateFireDepartmentMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :fire_department_memberships do |t|
      t.date :start_date
      t.references :fire_department, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
