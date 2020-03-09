class LandingpageController < ApplicationController
    def index
        if user_signed_in?
            redirect_to '/orders'
        end
        respond_to do |format|
            format.html
        end
    end
end