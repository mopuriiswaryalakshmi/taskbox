class CreateCricketerAverage1s < ActiveRecord::Migration
  def change
    create_table :cricketer_average1s do |t|
    	t.string :name
    	t.string :age
    	t.string :test_matches
    	t.string :average_runs

      t.timestamps null: false
    end
  end
end
