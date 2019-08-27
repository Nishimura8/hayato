class RecommendedController < ApplicationController
    before_action :set_recommended ,only: [:edit,:update,:destroy,:show]
    before_action :authenticate_user!, except: [:sports,:travel,:chat,:love,:hobby,:life,:travel,:gourmet,:game,:fashion,:entertainment,:mypage,:show,:index]
    def index
        @recommended= Recommended.search(params[:search]).order("created_at DESC").page(params[:page]).per(9)
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


  def edit
    if @recommended.user_id != current_user.id
        redirect_to root_path
    end
  end

  def update
    redirect_to root_path if @recommended.user_id != current_user.id
    if @recommended.update(recommended_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @recommended.user_id == current_user.id
      @recommended.destroy
      redirect_to root_path
    end
  end
    def show
        @user = @recommended.user
        @comment = Comment.new #①
        @comments = @recommended.comments #②
    end

    def mypage
        @user = User.find(params[:id])
        @recommended = Recommended.where(user_id: @user.id,).order("created_at DESC").page(params[:page]).per(9)
    end
    
    def sports
        @recommended = Recommended.where(category_id: 1).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def travel
        @recommended = Recommended.where(category_id: 2).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def chat
        @recommended = Recommended.where(category_id: 3).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def fashion
        @recommended = Recommended.where(category_id: 4).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def entertainment
        @recommended = Recommended.where(category_id: 5).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def life
        @recommended = Recommended.where(category_id: 6).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def love
        @recommended = Recommended.where(category_id: 7).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def gourmet
        @recommended = Recommended.where(category_id: 8).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def hobby
        @recommended = Recommended.where(category_id: 9).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

    def game
        @recommended = Recommended.where(category_id: 10).order("created_at DESC").order("created_at DESC").page(params[:page]).per(9)
    end

        



    private
    def set_recommended
        @recommended = Recommended.find(params[:id])
    end

    def recommended_params
        params.require(:recommended).permit(:image, :title,:content,:category_id ).merge(user_id: current_user.id)
    end
end
