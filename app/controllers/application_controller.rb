class ApplicationController < ActionController::Base

    def home

        @users = User.all
        @sams = Sam.newest
        #activerecord, scope
        
        if logged_in?
            @user = current_user
        end
    end

    def popular
        @users = User.all
        @sams = Sam.popular

        if logged_in?
            @user = current_user
        else
            @user = nil
        end
        render "home"
    end


    private

    def logged_in?
        !!current_user
    end

    helper_method :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

end
