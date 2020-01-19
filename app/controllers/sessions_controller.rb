class SessionsController < ApplicationController


    def new
        @user = User.new
        if logged_in?
            redirect_to root_path
        end
    end

    def login
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def create
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        redirect_to root_path
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