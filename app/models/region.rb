class Region < ApplicationRecord
  has_many :districts, dependent: :restrict_with_error

  before_validation :upcase_code

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }


  def self.ransackable_attributes(auth_object = nil)
    ["name", "code"]
  end

  private

  def upcase_code
    self.code = code.upcase if code.present?
  end
end
