class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.string :name
      t.integer :award_kind
      t.integer :dependent_on_award_id
      t.integer :minimum_service_years
      t.integer :minimum_age_for_award

      t.timestamps
    end
  end
end
