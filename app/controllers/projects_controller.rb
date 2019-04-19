class ProjectsController < ApplicationController
before_action :authenticate_user!
before_action :find_project_and_authorize , only: [:edit, :update, :show, :destroy]
before_action :set_project_and_authorize_project, only: [:add, :remove, :users]


	def index
		@projects = current_user.projects

	end

	def new
		
		@project = current_user.projects.build
		authorize @project
		
	end

	def create
		
		@project = Project.create(project_params)
		authorize @project
		@project.users << current_user
		
		if @project.save
			redirect_to @project	
		else
			render 'new'
		end

	end

	def edit
		authorize @project
		
	end

	def update

		authorize @project
		
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
		
	end

	def show
		authorize @project
		
	end

	def destroy
		authorize @project
		@project.destroy
		redirect_to projects_path
		
	end

	def users
		authorize @project
	end


	def remove
		authorize @project
		@user = User.find(params[:user_id])
		@project.users.destroy(@user.id)
		redirect_to project_users_path(@project.id)
	end

	def add
		authorize @project
		@project.users << User.find(params[:user_id])
		redirect_to project_users_path(@project.id)
	end

	def find_project_and_authorize
		@project  = Project.find(params[:id])
		authorize @project
	end

	def set_project_and_authorize_project
		@project = Project.find(params[:project_id])
		authorize @project
	end
	
	def project_params
		params.require(:project).permit(:title, :description)
	end

	def add_user
		params.permit(:project)
	end

end
