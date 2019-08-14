class RecommendedController < ApplicationController
    def index
        @reco = Recommended.all
    end

    def new
       @recommended = Recommended.new
    end

    def create
    @recommended = Recommended.new(recommended_params)
    if @recommended.save
        redirect_to root_path
    else
        render :new
    end
    end

    def show
        @recommended = Recommended.find(params[:id])
        @user = @recommended.user
    end
end
