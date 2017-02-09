class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.string :price
    	t.string :category 
    	t.string :brand
    	t.string :size
    	t.string :discount
    	t.string :color
    	t.string :availability

      t.timestamps null: false
    end
  end
end
