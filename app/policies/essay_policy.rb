class EssayPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists? && user == record.user
  end

  def create?
    user != nil
  end

  def new?
    create?
  end

  def update?
    scope.where(:id => record.id).exists? && user == record.user && record.draft?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
