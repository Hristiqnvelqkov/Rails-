class EnrollmentsController < ApplicationController
	def new
		@enrollment=Enrollment.new
	end
	def destroy
	end
	def create
		@event=Event.find(params[:id])
		@enrollment = current_user.enrollments.build(enrollment_params)
		@enrollment.save
		@event.enrollments<<@enrollment
		redirect_to root_url

	end
	def enrollment_params
		params.require(:enrollment).permit(:car_id ,:event_id)
	end
end

