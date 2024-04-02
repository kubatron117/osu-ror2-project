class Award < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :dependent_on_award, class_name: 'Award', optional: true
  has_one_attached :image

  enum award_kind: { recognition: 0, medal: 1, order: 2 }

  validates :name, presence: true, length: { maximum: 100 }
  validates :award_kind, presence: true, inclusion: { in: award_kinds.keys }
  validates :minimum_service_years, numericality: { greater_than_or_equal_to: 0 }
  validates :minimum_age_for_award, numericality: { greater_than_or_equal_to: 0 }
end

