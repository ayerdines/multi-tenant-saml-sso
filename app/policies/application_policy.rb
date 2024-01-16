# frozen_string_literal: true

class ApplicationPolicy
  def self.permit_admin_to(*actions)
    actions.each do |action|
      define_method("#{action}?") do
        member.admin?
      end
    end
  end

  attr_reader :member, :record

  def initialize(member, record)
    @member = member
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(member, scope)
      @member = member
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :member, :scope
  end
end
