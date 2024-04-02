class Member < ApplicationRecord
  has_many :fire_department_memberships
  has_many :fire_departments, through: :fire_department_memberships
  has_many :awards, dependent: :destroy

  enum role: { nothing: 0, superadmin: 1}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :address, length: { maximum: 255 }, allow_blank: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :member_code, presence: true, uniqueness: true

  validates :role, presence: true
end

