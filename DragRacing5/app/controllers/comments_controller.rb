class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
   def index
   	 @event = Event.find(params[:event_id])
     @comment=Comment.new
   end
   def show

   end
   def destroy
   	 @comment=Comment.find(params[:id])
     if (current_user.id==@comment.user_id)
       	@comment.destroy
        redirect_to root_url, notice: 'Event was successfully destroyed.'
     else
    	render :text=> "ko praish momche"
     end
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
  	respond_to do |format|
      if(@comment.save)
        format.html {}
        format.js   {}
        format.json { render json: @comment, status: :created, location: @comment }
      end  
    end  
    @event.comments << current_user.comments.build(comment_params)
         redirect_to root_url
  end
   def comment_params
    	params.require(:comment).permit(:newcomment)
    end
end
