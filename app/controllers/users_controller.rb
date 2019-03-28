class UsersController < ApplicationController
    def create
        User.create(user_params)
        render :show
    end

    def show
        @user = User.find(params[:id])
    end
     
    private
     
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
