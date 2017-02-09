class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name
    	t.string :rollnumber
    	t.string :department
    	t.string :course
    	t.string :yearofjoinig

      t.timestamps null: false
    end
  end
end
