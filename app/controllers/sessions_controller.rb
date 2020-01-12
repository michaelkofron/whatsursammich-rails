class SessionsController < ApplicationController


    def new

    end

    
    def destroy
        if logged_in?
            session[:user_id] = nil
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

    private
    
    def login_params
        params.require(:user).permit(:username, :password)
    end

end