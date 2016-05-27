class CommentsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
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
     else
    	render :text=> "ko praish momche"
     end
   end
   def edit
     @event = Event.find(params[:event_id])
   	 @comment=Comment.find(params[:id])
   end
   def update
     @event = Event.find(params[:event_id])
       @comment=Comment.find(params[:id])
      @comment.update(comment_params)
      render :index
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
      render :text => "assa"
    end
  end
   def comment_params
    	params.require(:comment).permit(:newcomment)
    end
end
