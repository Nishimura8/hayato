class ReviewController < ApplicationController
    before_action :authenticate_user!, only: :new

  def new
    @recommended = Recommended.find(params[:recommended_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :recommended, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:nickname,:rate, :review).merge(recommended_id: params[:recommended_id])
  end
end

