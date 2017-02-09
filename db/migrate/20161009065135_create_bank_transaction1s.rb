class CreateBankTransaction1s < ActiveRecord::Migration
  def change
    create_table :bank_transaction1s do |t|
    	t.string :name
    	t.string :account_number
    	t.string :balance


      t.timestamps null: false
    end
  end
end
