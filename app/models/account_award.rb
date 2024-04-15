class AccountAward < ApplicationRecord
  belongs_to :account
  belongs_to :award

  validate :eligible_for_award_based_on_age
  validate :eligible_for_award_based_on_service
  validate :eligible_for_award_based_on_dependencies

  private

  def eligible_for_award_based_on_age
    return if award.minimum_age_for_award.blank?

    member_age = ((Time.zone.now - account.birthdate.to_time) / 1.year.seconds).floor
    if member_age < award.minimum_age_for_award
      errors.add(:base, "Account does not meet the minimum age requirement for this award.")
    end
  end

  def eligible_for_award_based_on_service
    return if award.minimum_service_years.blank?

    earliest_start_date = account.fire_department_memberships.minimum(:start_date)
    service_years = earliest_start_date ? ((Time.zone.now - earliest_start_date.to_time) / 1.year.seconds).floor : 0
    if service_years < award.minimum_service_years
      errors.add(:base, "Account does not meet the minimum service requirement for this award.")
    end
  end

  def eligible_for_award_based_on_dependencies
    return if award.dependent_on_award_id.blank?

    unless account.awards.exists?(award.dependent_on_award_id)
      errors.add(:base, "Account does not have the required prerequisite award.")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["account_id", "award_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["account", "award"]
  end
end
