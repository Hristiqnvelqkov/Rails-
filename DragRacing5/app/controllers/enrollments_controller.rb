class EnrollmentsController < ApplicationController
	   before_action :authenticate_user!, :except => [:index]
	def new
		@enrollment=Enrollment.new
		@event = Event.find(params[:event_id])
	end
	def destroy
		@event=Event.find(params[:event_id])
		@enrollment=Enrollment.find(params[:enrollment_id])
		@enrollment.delete
		redirect_to @event
	end
	def index
		@event = Event.find(params[:event_id])
		@enrollments=Array.new
		@event.enrollments.each do |haha|
			@enrollments<<haha
		end
	end
	def create
		@event=Event.find(params[:event_id])
		@enrollment = current_user.enrollments.build(enrollment_params)
		@enrollment.save
		event_creator_id=@event.user_id
		if (User.exists?(id: event_creator_id))
			event_creator=User.find(event_creator_id)
			UserMailer.welcome_email(event_creator,current_user).deliver_now
			@event.enrollments<<@enrollment
			redirect_to @event	
		else 
			redirect_to @event
		end		
	end
	def enrollment_params
		params.require(:enrollment).permit(:car_id)
	end
end

