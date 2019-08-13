class WatchlistsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @watchlists = @user.watchlists
        render json:@watchlists
    end
    
    
    def create
        @watchlist = Watchlist.create(watchlist_params)
        render json: @watchlist
    end
    
    def destroy
        @watchlist = Watchlist.find(params[:id])
        @watchlist.destroy
        @user = User.find(watchlist_params[:user_id])
        @watchlists = @user.watchlists
        render json: @watchlists

    end

    private
    def watchlist_params
        params.require(:watchlist).permit(:user_id,:stock_id,:ticker)
    end
end
