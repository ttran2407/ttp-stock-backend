# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'

url = "https://api.iextrading.com/1.0/ref-data/symbols"

data = JSON.parse(RestClient.get(url).body)
data.each do |stock|

  Stock.create(ticker: stock['symbol'], company_name: stock['name'])
end


User.create(name: "Tien Tran", password: "123456",password_confirmation: "123456", cash: 100000)

Transaction.create(user_id: 1, stock_id: 7798, quantity: 10, stock_price:
340, ticker: "TSLA", transaction_type: "BUY")
Transaction.create(user_id: 1, stock_id: 7798, quantity: 10, stock_price:
340, ticker: "AAPL", transaction_type: "BUY")
Transaction.create(user_id: 1, stock_id: 7798, quantity: 10, stock_price:
340, ticker: "CVEO", transaction_type: "BUY")
Transaction.create(user_id: 1, stock_id: 7798, quantity: 10, stock_price:
340, ticker: "BABA", transaction_type: "BUY")

Watchlist.create(user_id: 1, stock_id: 7798, ticker: "TSLA" )
Watchlist.create(user_id: 1, stock_id: 14, ticker: "AAPL")
Watchlist.create(user_id: 1, stock_id: 1805, ticker: "CVEO")
Watchlist.create(user_id: 1, stock_id: 674, ticker: "BABA")
Watchlist.create(user_id: 1, stock_id: 676, ticker: "BAC")

Holding.create(user_id: 1, quantity: 2, stock_id: 7798, ticker: "TSLA" )
Holding.create(user_id: 1, quantity: 2, stock_id: 14, ticker: "AAPL")
Holding.create(user_id: 1, quantity: 2, stock_id: 1805, ticker: "CVEO")
Holding.create(user_id: 1, quantity: 2, stock_id: 674, ticker: "BABA")
Holding.create(user_id: 1, quantity: 2, stock_id: 676, ticker: "BAC")
