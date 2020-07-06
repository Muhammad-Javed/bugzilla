class BugPolicy < ApplicationPolicy

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  # CRUD actions
  def create?
    @user.qa?
  end

  def update?
    @user.bugs.include?(@bug)
  end

  def destroy?
    @user.bugs.include?(@bug) && @user.qa?
  end
end
