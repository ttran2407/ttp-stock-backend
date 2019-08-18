class HoldingsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @holdings = @user.holdings
        render json: @holdings
    end
    
    def create
        @user = User.find(holding_params[:user_id])
        @holding = @user.holdings.find_by(ticker: holding_params[:ticker])
        if  @holding != nil
            @holding.update(quantity: (holding_params[:quantity] + @holding[:quantity]))
        else
            @holding = Holding.create(
            user_id: holding_params[:user_id],
            stock_id: holding_params[:stock_id],
            quantity: holding_params[:quantity],
            ticker: holding_params[:ticker],
        )
        end
        
        @cost = holding_params[:quantity] * params[:stock_price]

        @user.update(cash: (@user[:cash].to_i - @cost))
        @holdings = @user.holdings
        render json: {holdings: @holdings,user: @user}
    end

    def update

        @holding = Holding.find(holding_params[:id])
        if @holding[:quantity] > holding_params[:quantity]
        @holding.update(quantity: (@holding[:quantity] - holding_params[:quantity]))
        else
        @holding.destroy
        end
        @user = User.find(holding_params[:user_id])
        @revenue = holding_params[:quantity] * params[:stock_price]
        @user.update(cash: (@user[:cash].to_i + @revenue))
        @holdings = @user.holdings
        
        render json: {holdings: @holdings, user: @user}
    end

    private
    def holding_params
        params.require(:holding).permit(:user_id,:stock_id, :ticker, :quantity, :stock_price, :id)
    end
end
