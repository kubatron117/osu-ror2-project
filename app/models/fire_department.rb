class FireDepartment < ApplicationRecord
  belongs_to :district
  has_many :fire_department_memberships, dependent: :restrict_with_error
  has_many :accounts, through: :fire_department_memberships, dependent: :restrict_with_error

  before_validation :upcase_code

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :district_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }

  private

  def upcase_code
    self.code = code.upcase if code.present?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["code", "name", "address", "district_id"]
  end
end
