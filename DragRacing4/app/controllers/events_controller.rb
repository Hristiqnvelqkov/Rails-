class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  def attend
    @event.attendees << current_user
    @event.save
    flash[:notice]='You are joined successfully'
    redirect_to root_url
  end
  def index
    @events = Event.all
  end

  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def create
     #before_action :authenticate_user!
    @event = Event.new(event_params)
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
    @event.destroy
       redirect_to events_url, notice: 'Event was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title,:description,:adress)
    end
end
