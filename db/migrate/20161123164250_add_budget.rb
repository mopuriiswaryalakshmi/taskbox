class AddBudget < ActiveRecord::Migration
  def change
  	add_column :projects, :budget, :float
  end
end
