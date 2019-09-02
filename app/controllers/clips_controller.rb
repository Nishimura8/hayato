class ClipsController < ApplicationController
    before_action :set,only: :create
    before_action :set2,only: :destroy
    def index
       @recommended = current_user.recommendeds.order("created_at DESC").page(params[:page]).per(9)
       @user =current_user.name
    end

    def create   
        @user_id = current_user.id
        @clip = Clip.new(recommended_id: @recommended.id, user_id: @user_id)   
          if @clip.save
            redirect_to "/favorite/#{current_user.id}"
          end
    
      end
    
      def destroy
        @clip = current_user.clips.find_by(recommended_id: @recommended.id)
        if @clip.destroy
          redirect_to "/favorite/#{current_user.id}"
        end
      end
      
      private
      def set
        @recommended = Recommended.find(params[:recommended_id])
      end

      def set2
        @recommended = Recommended.find(params[:id])
      end
end
