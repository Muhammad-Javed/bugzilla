class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  def initialize(user, project)
    @user = user
    @project = project
  end

  class Scope < Scope
    def resolve
      if @user.manager?
        scope.where(manager: @user)
      else
        scope.joins(:project_users).where(project_users: { user: @user })
      end
    end
  end

  # CRUD actions
  def create?
    @user.manager?
  end

  def update?
    @project.manager == @user
  end

  def show?
    @project.manager == @user || @project.users.include?(@user)
  end

  def index?
    true
  end

  def adds?
    @project.manager == @user
  end

  def add_bug?
    project_member? && @user.qa?
  end

  #use snake notiation show_bug
  def show_bug?
    project_member? && @user.developer?
  end

  def assign_bug?
    show_bug?
  end

  def remove_bug?
    @user.developer?
  end

  def update_bug?
    show_bug?
  end

  private

    def project_member?
      @project.users.include?(@user)
    end
end
