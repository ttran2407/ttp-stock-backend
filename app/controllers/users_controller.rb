class UsersController < ApplicationController
    skip_before_action :authorized
    def index 
        @users = User.all
        render json: @users
    end


    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: @user
        else 
            render json: {error: ""}, status: 402
        end
    end

    def update
        @user = User.find(param[:id])
        @user.update(cash: params[:cash])
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :cash)
    end
end
