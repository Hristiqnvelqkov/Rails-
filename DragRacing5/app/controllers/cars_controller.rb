class CarsController < ApplicationController
 before_action :authenticate_user!
 	def show
 		@user=User.find(params[:user_id])
 		@car=Car.find(params[:id])
 	end
	def index
		@cars=Car.all
	end
	def new
		@car=Car.new
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
        	respond_to do |format|
       		  format.html {redirect_to root_url}
        		 format.js
       		 end  
     	else
    		render :text=> "ko praish momche"
   		end
	end
	 def car_params
    	params.require(:car).permit(:mark,:horsepower,:wheeldrive,:avatar,:transmission,:enginetype,:coupe)
    end
end
