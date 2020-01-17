class SamsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :destroy
    
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

        @sam_name = params[:id].gsub!("-", " ")
        @sam = Sam.find_by(name: @sam_name)

        if @sam.user.id != session[:user_id]
            redirect_to root_path
        end
    end

    def show
        @sam_name = params[:id].gsub("-", " ")
        #have to take the dashes out of sammich param[:id] from the route to find sammich by its real nam
        #which is a name with spaces
        @sam = Sam.find_by(name: @sam_name)
    end

    def update 
        @sam = Sam.find(params[:id])
        @sam.update(name: params[:sam][:name], description: params[:sam][:description], image_url: params[:sam][:image_url])
        redirect_to sam_path(@sam.name.gsub!(" ", "-"))
    end

    def destroy
        #can delete a sammich
        Sam.find_by(name: params[:id]).destroy
        redirect_to root_path
    end

    private 

    def sam_params
        params.require(:sam).permit(:name, :description, :image_url, :user_id)
    end


end