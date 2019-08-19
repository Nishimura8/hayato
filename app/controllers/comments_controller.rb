class CommentsController < ApplicationController
    def create
        @recommended = Recommended.find(params[:recommended_id]) #①
        @comment = @recommended.comments.build(comment_params) #②
        @comment.user_id = current_user.id #③
        if @comment.save
          render :index 
        end
      end
    
      def destroy
        @comment = Comment.find(params[:id]) #⑤
        if @comment.destroy
          render :index #⑥
        end
      end
    
      private
        def comment_params
          params.require(:comment).permit(:content, :recommended_id, :user_id)
        end
end
