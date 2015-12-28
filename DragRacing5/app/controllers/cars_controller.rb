class CarsController < ApplicationController
	def index
		@cars=Car.all
	end
	def new
		@car=Car.new
	end
	def show
	end
	def edit
	end
	def create
		@car = current_user.cars.build(car_params)
		@car.save
		redirect_to root_url
  end
	def destroy
	end
	 def car_params
    	params.require(:car).permit(:mark)
    end
end
