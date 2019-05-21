class PropertyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  def create?
    true
  end

  private

  def user_is_owner_of_record?
    @user == @record.user # || admin
  end
end
