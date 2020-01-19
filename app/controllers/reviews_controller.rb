class ReviewsController < ApplicationController

    def new
        if logged_in?
            @review = Review.new
            @sammich = Sam.find_by(name: params[:sam_id].gsub!("-", " "))
            @user = User.find_by(id: session[:user_id])
        else
            redirect_to login_path
        end
    end

    def create
        @review = Review.new(review_params)

        if @review.valid?
            @review.save
            @sam = Sam.find_by(name: params[:sam_id])
            redirect_to sam_path(@sam.name.gsub!(" ", "-"))
        else
            redirect_to root_path
        end
    end

    def show

    end

    private
    
    def review_params
        params.require(:review).permit(:body, :rating, :user_id, :sam_id)
    end
end