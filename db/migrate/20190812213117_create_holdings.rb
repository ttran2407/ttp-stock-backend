class CreateHoldings < ActiveRecord::Migration[5.2]
  def change
    create_table :holdings do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :quantity
      t.string :ticker

      t.timestamps
    end
  end
end
