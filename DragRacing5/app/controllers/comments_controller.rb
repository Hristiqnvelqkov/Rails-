class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit]
   def index
   	 @event = Event.find(params[:event_id])
     @comment = @event.comments.paginate(:per_page => 5, :page => params[:page]).order('created_at DESC')
     #@comment=Comment.new
   end
   def show
   end
   def destroy
   	 @comment=Comment.find(params[:id])
     if (current_user.id==@comment.user_id)
       	@comment.destroy
        respond_to do |format|
         format.html {redirect_to root_url}
         format.js
        end  
     end
   end
   def edit
      @event = Event.find(params[:event_id])
      @comment=Comment.find(params[:id])
    if (current_user.id==@comment.user_id)
      else 
        redirect_to event_comments_path
      end
   end
   def update
     @event = Event.find(params[:event_id])
       @comment=Comment.find(params[:id])
      @comment.update(comment_params)
      redirect_to event_comments_path
    end
   def new
     @comment = Comment.new 
   end
  def create
  	@event=Event.find(params[:id])
  	@comment = current_user.comments.build(comment_params)
    @event.comments << current_user.comments.build(comment_params)
     if @comment.save
        redirect_to :action => :index
    else
      redirect_to new_event_comment_path notice: 'Comment was  not successfully updated.' 

    end
  end
  private
   def comment_params
    	params.require(:comment).permit(:newcomment)
    end
end
