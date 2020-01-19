class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path
            #redirect_to user_path(@user) #routes to your profile
        else
            render :new
        end
    end

    def show
        @user = User.find_by_username(params[:id])
        #to_param in users model
    end

    def sammiches
        @user = User.find_by_username(params[:id])
        #find the current user from the current URL username
        @sams = @user.sams
        #find all of their sammiches
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end