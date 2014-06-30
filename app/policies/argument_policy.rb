class ArgumentPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user != nil
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

  def transition_to_being_judged?
    add_judges?
  end

  def add_judges?
    scope.where(:id => record.id).exists? && (user == record.con_side || user == record.owner) && record.selecting_judges?
  end

end
