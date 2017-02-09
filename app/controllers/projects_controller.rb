class ProjectsController < ApplicationController

	before_action :authenticate_user!


	def index
		#@projects = Project.all
		@projects = current_user.projects 
		#Client.where('user_id = ?,current_user.id')
		#@projects = Project.order('start_date DESC')

	  end

	  def new
	  	@project = Project.new
	  end

	  def create
	  	@project = Project.new(project_params)
	  	@project.user_id = current_user.id #used to attach this client to the current logged in user
	  	if @project.save
	  		redirect_to project_path(@project), notice: "sucesfulLy created"
	  	else
	  		render action: "new"
	  	end
	  end

	  def show
        begin
	  	@project = Project.find(params[:id])
	  	@project = current_user.projects.find(params[:id])
	  	@task = Task.new
	  	rescue ActiveRecord::RecordNotFound
	  		redirect_to projects_path, notice: "Record Not Found"
	  	end

	  end

	  def export 
         @projects = current_user.projects
	  end

	  def edit
	  	@project = Project.find(params[:id])
	  end

	  def update
	  	@project = Project.find(params[:id])
	  	#@project.user_id = current_user.id
	  	if @project.update_attributes(project_params)
	  		redirect_to project_path(@project), notice: "successfully updated"
	  	else
	  		render action: "edit"
	  	end
	  end

	  def destroy
	  	@project = Project.find(params[:id])
	  	@project.destroy
	  	redirect_to projects_path, notice: "Successfully destroyed"
	  end



	  private

	  def project_params
	  	params[:project].permit(:name,:description,:start_date,:end_date,:client_id,:status,category_ids: [])
	  end
	end
	  
