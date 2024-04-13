# app/services/add_award_to_member_service.rb
class AddAwardToMemberService
  include ActiveModel::Model

  attr_accessor :account_id, :award_id

  validates :account_id, :award_id, presence: true
  validate :account_must_exist
  validate :award_must_exist

  def initialize(params)
    @account_id = params[:account_id]
    @award_id = params[:award_id]
  end

  def call
    return false unless valid?

    AccountAward.create(account_id: @account_id, award_id: @award_id)
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, "Failed to create AccountAward: #{e.message}")
    false
  end

  private

  def account_must_exist
    errors.add(:account_id, "is invalid") unless Account.exists?(@account_id)
  end

  def award_must_exist
    errors.add(:award_id, "is invalid") unless Award.exists?(@award_id)
  end
end
