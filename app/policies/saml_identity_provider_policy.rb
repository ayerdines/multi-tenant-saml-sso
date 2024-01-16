class SamlIdentityProviderPolicy < ApplicationPolicy
  permit_admin_to :index, :show, :new, :create, :edit, :destroy, :update

  class Scope < Scope
    def resolve
      scope.where(organization_id: member.organization_id)
    end
  end
end
