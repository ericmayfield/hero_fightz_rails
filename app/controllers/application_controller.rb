class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_user, :belongs_to_user

    # def belongs_to_user?(record)
        
    # end

    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    #Checks if current user logged in matches user record trying to view
    def is_user
        if params[:id]
            puts params[:id]
            if params[:id] != current_user.id
                flash[:alert] = "You don't have access to view this content."
                redirect_to account_path(current_user)
            end
        end
    end
end
