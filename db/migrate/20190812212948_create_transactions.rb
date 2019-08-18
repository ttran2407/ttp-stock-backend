class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :stock_id
      t.float :stock_price
      t.integer :quantity
      t.string :ticker
      t.string :transaction_type

      t.timestamps
    end
  end
end
