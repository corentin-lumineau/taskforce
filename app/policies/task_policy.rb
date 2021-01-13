class TaskPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def done?
    return true
  end

  def destroy?
    return true
  end
end
