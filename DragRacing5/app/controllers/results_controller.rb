class ResultsController < ApplicationController
	def index
	end
	def new
		@event=Event.find(params[:event_id])
		@result=Result.new
	end
	def create
		@event=Event.find(params[:id])
  		@result = current_user.results.build(result_params)
  		@result.save
  		@event.results<<@result
  		render :new
	end
	def destroy
	end
	def result_params
		params.require(:result).permit(:user_result,:visitor_id)
	end
end
