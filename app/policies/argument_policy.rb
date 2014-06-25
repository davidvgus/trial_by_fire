class ArgumentPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    scope.where(:id => record.id).exists? && user == record.con_side && record.submitted?
  end

  def edit?
    update?
  end

end
