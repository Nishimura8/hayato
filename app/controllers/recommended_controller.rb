class RecommendedController < ApplicationController
    def index
        @recommended= Recommended.order("created_at DESC")
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

    private
    def recommended_params
        params.require(:recommended).permit(:image, :title,:content, ).merge(user_id: current_user.id)
    end
end
