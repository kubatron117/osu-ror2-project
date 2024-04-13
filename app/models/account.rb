class Account < ApplicationRecord
  include Rodauth::Model(RodauthMain)
  enum :status, unverified: 1, verified: 2, closed: 3

  has_many :fire_department_memberships, dependent: :destroy
  has_many :fire_departments, through: :fire_department_memberships
  has_and_belongs_to_many :awards, dependent: :destroy

  enum role: { nothing: 0, superadmin: 1}

  validates :first_name, presence: true, length: { maximum: 70 }
  validates :last_name, presence: true, length: { maximum: 70 }
  validates :birthdate, presence: true
  validates :address, length: { maximum: 255 }, allow_blank: true
  validates :phone, presence: true, uniqueness: true
  validates :member_code, presence: true, uniqueness: true
  validates :role, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end
end
