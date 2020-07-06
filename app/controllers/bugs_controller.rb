class BugsController < ApplicationController
  before_action :set_project, only: [:destroy, :create,  :update, :edit ]
  before_action :set_bug, only: [:edit, :destroy, :update]

  def create
    authorize Bug
    @bug = @project.bugs.build(bug_params)
    if @bug.save
      redirect_to add_bug_project_path(@project.id)
    end
  end

  def new; end

  def edit; end

  def update
    authorize @bug
    @bug = @project.bugs.find(params[:id])
    if @bug.update_attributes(bug_params)
      redirect_to add_bug_project_path(@project.id)
    end
  end

  def destroy
    if policy(@bug).destroy?
      @bug.destroy
      redirect_to add_bug_project_path(@project.id)
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_bug
       @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:title, :deadline, :status, :screenshot, :bug_type, :qa_id)
    end
end
