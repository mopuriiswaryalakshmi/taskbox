class TasksController < ApplicationController

	def create

		@task = Task.new(task_params)
		
		if @task.save
		redirect_to project_path(@task.project_id), notice: "successfully created"
	else
		render action: "new"
	end
end

def mark_as_complete
   task = Task.find(params[:task_id])
   task.update_attributes(is_completed: true)
   Notification.task_complete(task).deliver
   redirect_to :back, notice: "successfully completed task"

end

def mark_as_incomplete
	task = Task.find(params[:task_id])
	task.update_attributes(is_completed: false)
    redirect_to :back, notice: "Task is incomplete"

end


private
 
 def task_params
 	params[:task].permit(:title, :project_id, :is_completed, :due_date)
 end
end

