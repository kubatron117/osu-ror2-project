class Account < ApplicationRecord
  include Rodauth::Model(RodauthMain)
  enum :status, unverified: 1, verified: 2, closed: 3

  has_many :fire_department_memberships, dependent: :destroy
  has_many :fire_departments, through: :fire_department_memberships
  has_many :account_awards, dependent: :destroy
  has_many :awards, through: :account_awards

  enum role: { nothing: 0, superadmin: 1}

  validates :first_name, presence: true, length: { maximum: 70 }
  validates :last_name, presence: true, length: { maximum: 70 }
  validates :birthdate, presence: true
  validates :address, length: { maximum: 255 }, allow_blank: true
  validates :phone, presence: true, uniqueness: true
  validates :member_code, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: roles.keys }


  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def self.ransackable_attributes(auth_object = nil)
    ["address", "birthdate", "email", "first_name", "id", "last_name", "member_code", "phone", "role", "status", "full_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["awards", "fire_department_memberships", "fire_departments"]
  end

  ransacker :full_name do
    Arel.sql("CONCAT(first_name, ' ', last_name)")
  end

end
