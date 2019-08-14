class RecommendedController < ApplicationController
    def index
        @reco = Recommended.all
    end

    def show
        @recommended = Recommended.find(params[:id])
        @user = @recommended.user
    end
end
