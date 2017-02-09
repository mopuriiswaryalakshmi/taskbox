class CreateStudentManagment1s < ActiveRecord::Migration
  def change
    create_table :student_managment1s do |t|
    	t.string :name
    	t.string :rollnumber
    	t.string :department
    	t.string :course
    	t.string :yearofjoinig 

      t.timestamps null: false
    end
  end
end
