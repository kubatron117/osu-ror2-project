class Award < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :dependent_on_award, class_name: 'Award', optional: true
  has_one_attached :image, dependent: :destroy
  has_and_belongs_to_many :accounts

  enum award_kind: { acknowledgement: 0, medal: 1, magnitude: 2 }

  validates :name, presence: true, length: { maximum: 100 }
  validates :award_kind, presence: true, inclusion: { in: award_kinds.keys }
  # validates :dependent_on_award_id, presence: true, allow_blank: true
  validates :minimum_service_years, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }
  validates :minimum_age_for_award, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true  }
end

