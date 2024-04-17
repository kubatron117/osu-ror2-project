class Ability
  include CanCan::Ability

  def initialize(account)
    alias_action :create, :read, :update, :destroy, to: :crud


    cannot :manage, :all

    return unless account.present?
    if account.role == 'superadmin'
      can :manage, :all
    elsif account.role == 'nothing'
      if account.fire_department_memberships.exists?(role: :admin, status: :active)
        fire_department_ids = account.fire_department_memberships.where(role: :admin, status: :active).pluck(:fire_department_id)
        can :manage, FireDepartmentMembership, fire_department_id: fire_department_ids
        can :manage, Account, fire_department_memberships: { fire_department_id: fire_department_ids }
        cannot :update_role, Account
      end
    end

  end
end