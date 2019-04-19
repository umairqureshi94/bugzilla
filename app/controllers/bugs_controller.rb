class BugsController < ApplicationController
before_action :authenticate_user!
before_action :set_and_authorize_resource, only: [:assign, :resolved]
before_action :find_project, only: [:new , :create]

	def index
		@bugs = Bug.all.order("id ASC")
	end

  def new
    @bug = Bug.new
    authorize @bug
  end

  def create
  	@bug = @project.bugs.create(bug_params)
    authorize @bug
    if @bug.errors.any?
      render 'new'  
    else
      redirect_to project_path(@project)
    end    
  end

  def assign
    @bug.users << current_user
    @bug.status = "STARTED"
    @bug.save
    
    redirect_to project_path(@bug.project.id)

  end

  def resolved
    @bug.resolve_bug
    redirect_to project_path(@bug.project.id)
  end


  private

  def set_and_authorize_resource
    @bug = Bug.find(params[:bug_id])
    authorize @bug
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def bug_params
  	params.require(:bug).permit(:title, :description, :deadline, :b_type, :status, :image)
  end


end
