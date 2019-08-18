class User < ApplicationRecord
    has_many :transactions
    has_many :watchlists
    has_many :holdings
    has_many :stocks, through: :transactions
    has_many :stocks, through: :watchlists
    has_many :stocks, through: :holdings

    validates :email, uniqueness: { case_sensitive: false }, presence: true
    has_secure_password
end

