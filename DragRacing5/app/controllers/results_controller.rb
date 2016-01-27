class ResultsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@event=Event.find(params[:id])
  		@result = current_user.results.build(result_params)
	end
	def destroy
	end
	def result_params
	end
end
