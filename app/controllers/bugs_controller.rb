class BugsController < ApplicationController
before_action :authenticate_user!

	def index
		@bugs = Bug.all.order("id ASC")
		authorize @bugs
	end


  def new
    @project = Project.find(params[:project_id])
    @bug = Bug.new
    authorize @bug
  end

  def create
    
  	@project = Project.find(params[:project_id])
  	@bug = @project.bugs.create(bug_params)

    if @bug.errors.any?
      render 'new'  
    else
      redirect_to project_path(@project)
    end
     authorize @bug
    
  end

  def destroy
  	authorize @bug

  	@project = Project.find(params[:project_id])
  	@bug = @project.bugs.find(params[:id])
  	@bug.destroy

  	redirect_to project_path(@project)
  end

  def assign
    @bug = Bug.find(params[:bug_id])
    authorize @bug
    @bug.users << current_user
    @bug.status = "STARTED"
    @bug.save
    
    redirect_to project_path(@bug.project.id)

  end

  def resolved
    puts 'here' * 1000
    @bug = Bug.find(params[:bug_id])
    authorize @bug
    
    if @bug.b_type == "BUG"
        @bug.status = "RESOLVED"
    else
        @bug.status = "COMPLETED"
    end
    @bug.save
    redirect_to project_path(@bug.project.id)
    
  end


  private
  def bug_params
  	params.require(:bug).permit(:title, :description, :deadline, :b_type, :status, :image)
  	
  end


end
