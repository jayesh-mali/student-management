class StudentPolicy < ApplicationPolicy
  def show?
    record.created_by_id == user.id
  end

  def update?
    record.created_by_id == user.id
  end

  def destroy?
    record.created_by_id == user.id
  end
end
