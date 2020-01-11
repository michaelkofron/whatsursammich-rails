class ApplicationController < ActionController::Base

    include ApplicationHelper

    def home
        if logged_in?
            render "user"
        else
            render "visitor"
        end
        #if logged in show logged in page session_home.html.erb
        #if not logged in show not logged in page home.html.erb
        #either way home requires access to sammich posts to show
    end
end
