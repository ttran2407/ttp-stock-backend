class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :user_id
      t.string :stock_id
      t.string :stock_price
      t.string :quantity

      t.timestamps
    end
  end
end
