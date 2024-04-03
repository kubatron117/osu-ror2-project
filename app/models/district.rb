class District < ApplicationRecord
  belongs_to :region
  has_many :fire_departments, dependent: :destroy

  before_validation :upcase_code

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :region_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }

  private

  def upcase_code
    self.code = code.upcase if code.present?
  end
end
