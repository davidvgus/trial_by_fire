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
    scope.where(:id => record.id).exists? && user == record.con_side && record.being_critiqued?
  end

  def edit?
    update?
  end

  def submit_to_judgement?
    update?
  end

end
