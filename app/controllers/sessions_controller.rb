class SessionsController < ApplicationController
    def create
        #add if/else struct, check for auth, using binding
        #for omniauth generate securerand u.password = method_from securerand
        @user = User.find_by(email: params[:email])
        if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            redirect_to account_path
        else
            flash[:alert] = "Username or Password Incorrect"
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
