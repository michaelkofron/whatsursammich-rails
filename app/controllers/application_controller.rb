class ApplicationController < ActionController::Base

    def home

        @users = User.all
        @sams = Sam.newest
        #activerecord, scope
        
        if logged_in?
            @user = current_user
            render "user"
        else
            render "visitor"
        end
        #if logged in show logged in page session_home.html.erb
        #if not logged in show not logged in page home.html.erb
        #either way home requires access to sammich posts to show
    end

    def popular
        @users = User.all
        @sams = Sam.popular

        if logged_in?
            @user = current_user
        else
            @user = nil
        end
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
