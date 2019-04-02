class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to account_path(@user)
    end

    def show
        is_user
    end

    def edit
        is_user
    end

    def update
    end

    def destroy
        @user.delete
    end
     
    private
     
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def load_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to login_path
        end
    end
end
