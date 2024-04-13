class AccountAward < ApplicationRecord
  belongs_to :account
  belongs_to :award

  private

  def self.ransackable_attributes(auth_object = nil)
    ["account_id", "award_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["account", "award"]
  end
end
