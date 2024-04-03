class CreateJoinTableAccountsAwards < ActiveRecord::Migration[7.1]
  def change
    create_join_table :accounts, :awards do |t|
      # t.index [:account_id, :award_id]
      # t.index [:award_id, :account_id]
    end
  end
end
