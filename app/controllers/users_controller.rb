class UsersController < ApplicationController
    def create
        User.create(user_params)
        render :show
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to login_path
        end
    end
     
    private
     
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
