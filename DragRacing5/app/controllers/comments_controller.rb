class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
   def index
   	 @event = Event.find(params[:event_id])
  end
   def show

   end
   def edit
   	 @comment=Comment.find(params[:id])
   end
   def new
    @comment = Comment.new
  end
  def create
  	@event=Event.find(params[:id])
  	@comment = current_user.comments.build(comment_params)
  	@comment.save
    @event.comments << current_user.comments.build(comment_params)
         redirect_to root_url
  end
   def comment_params
    	params.require(:comment).permit(:newcomment)
    end
end
