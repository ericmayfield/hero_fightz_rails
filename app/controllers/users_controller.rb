class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit, :update, :destroy]
    before_action :is_user, except: [:index, :new, :create]

    def new
        # Checks if a user is logged in before allowing account creation
        if !logged_in?
            @user = User.new
        else
            redirect_to account_path
        end
    end

    def create
        @user = User.create(user_params)
        redirect_to account_path(@user)
    end

    def show
    end

    def edit
    end

    def update
        @user = User.new(user_params)

        if @user.save
            redirect_to account_path
        else
            redirect_to account_edit_path
        end
    end

    def destroy
        @user.delete
        session.delete :user_id
        redirect_to root_path
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

    #Checks if current user logged in matches user record trying to view
    def is_user
        if params[:id] && params[:id] != current_user.id
            flash[:alert] = "You do not have access to the content you were attempting to view."
            redirect_to account_path
        end
    end
end
