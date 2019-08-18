class LikesController < ApplicationController
    before_action :set_variables
  
    def like
      like = current_user.likes.new(recommended_id: @recommended.id)
      like.save
    end
  
    def unlike
      like = current_user.likes.find_by(recommended_id: @recommended.id)
      like.destroy
    end
  
    private
  
    def set_variables
      @recommended = Recommended.find(params[:recommended_id])
      @id_name = "#like-link-#{@recommended.id}"
    end
  
  end