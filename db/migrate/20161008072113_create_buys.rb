class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
    	t.string :name
    	t.string :products
    	t.string :email




     t.timestamps null: false
    end
  end
end
