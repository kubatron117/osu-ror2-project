class FireDepartmentMembership < ApplicationRecord
  belongs_to :fire_department
  belongs_to :member

  enum role: { member: 0, admin: 1 }
  enum status: { active: 0, archived: 1 }

  validates :start_date, presence: true
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates :status, presence: true, inclusion: { in: statuses.keys }
end

