class TransactionsController < ApplicationController
    def index 
        @user = User.find(params[:user_id])
        @transactions = @user.transactions
        render json: @transactions
    end

    def create
        @stock = Stock.find_by(ticker: transaction_params[:ticker])
        @transaction = Transaction.create(
            user_id: transaction_params[:user_id],
            stock_id: @stock.id,
            ticker: transaction_params[:ticker],
            quantity: transaction_params[:quantity],
            stock_price: transaction_params[:stock_price],
            transaction_type: transaction_params[:transaction_type],
        )
        # @user = User.find(params[:user_id])
        # @transactions = @user.transactions
        render json: @transaction
    end

    private
    def transaction_params
        params.require(:transaction).permit(:user_id, :quantity, :stock_price, :ticker, :transaction_type)
    end
end
