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
            redirect_to users_path
        end
    end

    def show
        @user = User.find_by_username(params[:id])
        #to_param in users model
    end


    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end