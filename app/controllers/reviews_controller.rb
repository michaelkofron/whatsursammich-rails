class ReviewsController < ApplicationController

    def new
        if logged_in?
            @review = Review.new
            @sammich = Sam.find_by(name: params[:sam_id].gsub!("-", " "))
            @user = User.find_by(id: session[:user_id])
            truth = false
            #truth of whether or not the user has reviewed this sammich
            #it is false until proven true

            @sammich.reviews.each do |review|
                if review.user == @user
                    truth = true
                end
            end

            if @sammich.user.id == @user.id || truth
                redirect_to sam_path(params[:sam_id].gsub!(" ", "-"))
            end
            #if the sammich is the user's own sammich they cannot write a review
            #if a user previously wrote a review for this sammich they cannot write another
        else
            redirect_to login_path
        end
    end

    def create
        @review = Review.new(review_params)

        if @review.valid?
            @review.save
            @sam = Sam.find_by(name: params[:sam_id])
            @value = @review.rating * 10
            @spoint = Spoint.create(sam_id: @sam.id, user_id: @sam.user.id, value: @value)
            #sam maker gets sam points if someone writes a review for them, based on star rating
            @rpoint = Rpoint.create(review_id: @review.id, user_id: session[:user_id], value: 10)
            #user gets 10 review points for writing a review
            redirect_to sam_path(@sam.name.gsub!(" ", "-"))
        else
            @errors = @review.errors.full_messages
            @sammich = Sam.find_by(name: params[:sam_id])
            @user = @review.user
            #redirect_to new_sam_review_path(params[:sam_id].gsub!(" ", "-"))
            render :new
        end
    end

    def show
        @review = Review.find_by(id: params[:id])

    end

    private
    
    def review_params
        params.require(:review).permit(:body, :rating, :user_id, :sam_id)
    end
end