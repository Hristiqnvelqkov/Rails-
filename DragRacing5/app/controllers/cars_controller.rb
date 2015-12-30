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
		@car=Car.find(params[:id])
     	if (current_user.id==@car.user_id)
       		@car.destroy
        	redirect_to root_url, notice: 'Car was successfully destroyed.'
     	else
    		render :text=> "ko praish momche"
   		end
	end
	 def car_params
    	params.require(:car).permit(:mark,:horsepower)
    end
end
