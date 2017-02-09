class CreateMenuDrivenBook1s < ActiveRecord::Migration
  def change
    create_table :menu_driven_book1s do |t|
    	t.string :name
    	t.string :author
    	t.string :borrowed
    	t.integer :count

      t.timestamps null: false
    end
  end
end
