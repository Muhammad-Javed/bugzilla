class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,  :edit, :adds, :add_bug, :remove, :show_bug,:assign_bug, :remove_bug, :update_bug]
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_user_projects, only: [:update, :destroy]
  before_action :set_user_params, only: [:remove, :adds]
  before_action :set_bug,  only: [:assign_bug, :remove_bug, :update_bug]
  before_action :set_developer, only: [:assign_bug, :remove_bug]

  before_action :authenticate_user!

  def index
    authorize Project
    @projects = policy_scope(Project)
  end

  def create
    authorize Project.new
    @project = @user.projects.create(project_params)
    if @project.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    authorize @project
  end

  def show
    authorize @project
    working_users = @project.users
    @qa = working_users.select{ |user| user.type == "Qa" }
    @dev = working_users.select{ |user| user.type == "Developer" }
    @qa_developers = User.qa_dev
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize @project
    if @project.destroy
      redirect_to root_path
    end
  end

  def remove
    authorize @project
    if ProjectUser.find_by(user: @user, project: @project).destroy
      redirect_to @project
    end
  end

  #adding developer and QA to the project
  def adds
    authorize @project
    @project_user = ProjectUser.create(user: @user, project: @project)
    redirect_to @project
  end

  def add_bug
    authorize @project
  end

  #showing all bugs belongs to the project and unassigned to any other developers
  def show_bug
    authorize @project
    @developer_bugs = @project.bugs.where(developer: current_user)
    @unassigned_bugs = @project.bugs.all
  end

  def assign_bug
    authorize @project
    @bug.developer_id = current_user.id
    if @bug.save
      redirect_to show_bug_project_path
    end
  end

  def remove_bug
    authorize @project
    if @bug.update_attributes(developer_id: nil)
      redirect_to show_bug_project_path
    end
  end

  def update_bug
    authorize @project
    if @bug.update_attributes(:status => "Resolved")
      redirect_to show_bug_project_path
    end
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_user_projects
      @project = @user.projects.find(params[:id])
    end

    def set_user_params
      @user = User.find(params[:user_id])
    end

    def set_bug
      @bug = Bug.find(params[:bug_id])
    end

    def set_developer
      @user =  User.find(params[:developer_id])
    end
end
