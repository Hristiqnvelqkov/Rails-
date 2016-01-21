class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy,:attend,:cancel,:like,:unlike]
  before_action :authenticate_user!, :except => [:show, :index]
 # before_action :set_comment, only: [:mycomment]
  def like
    @event.liked_by current_user
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
    #render :partial => "views/like"
    #redirect_to root_url
  end
  def unlike
    @event.unliked_by  current_user
     respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end  
  end 
  def attend
    @event.users<<current_user
    flash[:notice]='You are joined successfully'
    redirect_to root_url
  end
  def cancel
    @event.users.delete(current_user)
    flash[:notice]="You are canceled for the event"
    redirect_to root_url
  end  
  def index
    @events = Event.all
  end

  def show
    #@comment=Comment.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  	if (current_user.id!=@event.user_id)
  		render :text=>"dsisdids"
  	end
  end

  def create
    @event = current_user.events.build(event_params)
      if @event.save
         redirect_to @event, notice: 'Event was successfully created.' 
      else
         render :new 
      end  
  end

  def update
      if @event.update(event_params)
       redirect_to @event, notice: 'Event was successfully updated.' 
      else
         render :edit 
      end
  end

  def destroy
  	if (current_user.id==@event.user_id)
    	@event.destroy
       redirect_to events_url, notice: 'Event was successfully destroyed.'
    else
    	render :text=> "ko praish momche"
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :adress,:date)
    end
end
