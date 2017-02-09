class Project < ActiveRecord::Base

	belongs_to :client
	belongs_to :user



    has_many :project_categories
	has_many :categories, through: :project_categories
	has_many :tasks



	validates :name, presence: true
	validates_length_of :description, minimum: 10
	validates_presence_of :status
	#when arguments are passed for a method we use : before, and for options for the method we pass : after, the values for the options we pass : before
	#validates_presence_of :name
	#validates_presence_of :start_date
    # validates_presence_of :name
	#custom validations
	#this validation will only get invoked at the time of creating a new record, and not updating
	validate :check_status_on_create, on: :create
	validate :check_start_date, on: :create
	validate :check_projects, on: :create
	validate :check_uniqueness, on: :create

	 
     def overdue_tasks
     	self.tasks.where('is_completed = ? AND due_date > ?', false,Date.today)
     end

    def incomplete_tasks
    	self.tasks.where('is_completed = ?', false)
    end

	 def completed_tasks
	 	self.tasks.where('is_completed = ?', true)
	 	#Task.where('is_completed = ? AND project_id = ?', true, self.id)
	 end


	 def calc_completed
	 	return (self.completed_tasks.size / self.tasks.size.to_f)*100
	 end

	 def calc_incomplete
	 	return (self.incomplete_tasks.size / self.tasks.size.to_f)*100
	 end

	 def calc_overdue
	 	return (self.overdue_tasks.size / self.tasks.size.to_f)*100
	 end



	
	private 

	def check_status_on_create
		if self.status != "new"
			errors.add(:status, " is not new")
		end
	end

	def check_start_date
		if !self.start_date.nil?
		if self.start_date > Date.today + 7.days
             errors.add(:start_date, "is not with in 10 days")
    end
   end
end
 #if !(self.start_date.nil?) && self.start_date > Date.today +7.days

 #one client cannot have more than 2 projects

    def check_projects
    	projects =  Project.where('client_id= ?', self.client_id)
    	if projects.count>5
    	errors.add(:client_id, "more than 2 projects") 
       end

    end
   

   #checking uniqueness of project_name

     def check_uniqueness
    	projects =  Project.where('name= ?', self.name)
     	if projects.count>5
     	errors.add(:name, "more than 1 projects") 
        end
     end

end
