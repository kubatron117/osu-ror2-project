class AddAwardToMemberJob < ApplicationJob
  queue_as :default

  def perform(account_award_params)
    service = AddAwardToMemberService.new(account_award_params)
    unless service.call
      Rails.logger.error("Failed to add award to member: #{service.errors.full_messages.join(', ')}")
    end
  end
end
