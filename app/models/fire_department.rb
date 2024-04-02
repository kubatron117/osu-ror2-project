class FireDepartment < ApplicationRecord
  belongs_to :district
  has_many :fire_department_memberships
  has_many :accounts, through: :fire_department_memberships

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
end
