class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.string :user_id
      t.string :stock_id
      t.string :ticker

      t.timestamps
    end
  end
end
