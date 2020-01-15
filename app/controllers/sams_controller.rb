class SamsController < ApplicationController

    def new 

        if logged_in?
            @sam = Sam.new
            @user = User.find_by(id: session[:user_id])
        else
            redirect_to root_path
        end
            
    end

    def create
        @sam = Sam.create(sam_params)
        
        @user = User.find_by_id(session[:user_id])


        redirect_to user_sammiches_path(@user.username)
    end

    def edit
        #edits sammich, will need an edit view with text already inside
    end

    def show
        #individual sammich page
    end

    def update 
        #post of edit
    end

    def destroy
        #can delete a sammich
    end

    private 

    def sam_params
        params.require(:sam).permit(:name, :description, :image_url, :user_id)
    end


end