class District < ApplicationRecord
  belongs_to :region
  has_many :fire_departments, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
end
