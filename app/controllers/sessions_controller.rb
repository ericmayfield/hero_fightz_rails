class SessionsController < ApplicationController
    def create
        #add if/else struct, check for auth, using binding
        #for omniauth generate securerand u.password = method_from securerand
        @user = User.find_by(email: params[:email])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
