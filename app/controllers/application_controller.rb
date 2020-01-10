class ApplicationController < ActionController::Base

    def home
        #if logged in show logged in page session_home.html.erb
        #if not logged in show not logged in page home.html.erb
        #either way home requires access to sammich posts to show
    end
end
