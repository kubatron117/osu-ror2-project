class Member < ApplicationRecord
  has_many :fire_department_memberships
  has_many :fire_departments, through: :fire_department_memberships
  has_many :awards, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :member_code, presence: true, uniqueness: true

  validates :role, presence: true
end

