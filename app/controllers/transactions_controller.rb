class TransactionsController < ApplicationController
    def index 
        @user = User.find(params[:user_id])
        @transactions = @user.transactions
        render json: @transactions
    end

    def create
        @transaction = Transaction.create(transaction_params)
        # @user = User.find(params[:user_id])
        # @transactions = @user.transactions
        render json: @transaction
    end

    private
    def transaction_params
        params.require(:transaction).permit(:user_id, :stock_id, :quantity, :stock_price, :ticker, :transaction_type)
    end
end
