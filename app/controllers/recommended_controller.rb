class RecommendedController < ApplicationController
    def index
        @recommended= Recommended.order("created_at DESC").page(params[:page]).per(21)
        # @recommended = current_user.recommendeds
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
        @comment = Comment.new #①
        @comments = @recommended.comments #②
    end

    def mypage
        @recommended = Recommended.where(user_id: current_user.id,).order("created_at DESC")
        @user =current_user.name
    end
    
    def sports
        @recommended = Recommended.where(category_id: 1).order("created_at DESC")
    end

    def travel
        @recommended = Recommended.where(category_id: 2).order("created_at DESC")
    end

    def chat
        @recommended = Recommended.where(category_id: 3).order("created_at DESC")
    end

    def fashion
        @recommended = Recommended.where(category_id: 4).order("created_at DESC")
    end

    def entertainment
        @recommended = Recommended.where(category_id: 5).order("created_at DESC")
    end

    def life
        @recommended = Recommended.where(category_id: 6).order("created_at DESC")
    end

    def love
        @recommended = Recommended.where(category_id: 7).order("created_at DESC")
    end

    def gourmet
        @recommended = Recommended.where(category_id: 8).order("created_at DESC")
    end

    def hobby
        @recommended = Recommended.where(category_id: 9).order("created_at DESC")
    end

    def game
        @recommended = Recommended.where(category_id: 10).order("created_at DESC")
    end



    private
    def recommended_params
        params.require(:recommended).permit(:image, :title,:content,:category_id ).merge(user_id: current_user.id)
    end
end
