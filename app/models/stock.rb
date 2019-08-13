class Stock < ApplicationRecord


    has_many :transactions
    has_many :holdings
    has_many :watchlists

    has_many :users, through: :transactions
    has_many :users, through: :holdings
    has_many :users, through: :watchlists
    
end
