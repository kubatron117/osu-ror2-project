class FireDepartmentMembership < ApplicationRecord
  belongs_to :fire_department
  belongs_to :account

  enum role: { member: 0, admin: 1 }
  enum status: { active: 0, archived: 1 }

  validates :start_date, presence: true
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :fire_department_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }
  validates :account_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }

  validate :validate_active_account

  private

  def validate_active_account
    return unless account_id.present?

    existing_active_membership = FireDepartmentMembership.find_by(account_id: account_id, status: :active)
    if status == 'active' && existing_active_membership && existing_active_membership.id != id
      errors.add(:account_id, "can't have more than one active membership")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["start_date", "role", "status", "fire_department_id", "account_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["account", "fire_department"]
  end
end

