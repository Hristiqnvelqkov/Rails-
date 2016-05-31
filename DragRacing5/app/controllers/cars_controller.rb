class CarsController < ApplicationController
 before_action :authenticate_user!
 	def show
 		@user=User.find(params[:user_id])
 		@car=Car.find(params[:id])
 	end
  def usercarshow
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
      @car=Car.find(params[:id])
    if (current_user.id==@car.user_id)
      else 
        redirect_to event_comments_path
      end
   end
   def update
       @car=Car.find(params[:id])
      @car.update(car_params)
      render :index
    end
	def create
		@car = current_user.cars.build(car_params)
		@car.save
		render :index
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
