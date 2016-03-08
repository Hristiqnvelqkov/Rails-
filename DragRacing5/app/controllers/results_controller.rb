class ResultsController < ApplicationController
	def index
		@event=Event.find(params[:event_id])
	end
	def visitors
		@awd=Hash.new
		@event=Event.find(params[:id])
		@event.results.each do |stat|
			value=stat.user_result.to_f
			user=User.find(stat.visitor_id)
			@awd[user.email]=value
		end	
		return @awd
	end

	def statistics
		@statis=Hash.new
		@cars=Hash.new
		@event=Event.find(params[:id])
		@event.results.each do |stat|
			value=stat.user_result.to_f
			user=User.find(stat.visitor_id)
			@statis[user.email]=value
		end	
		@event.enrollments.each do |enr|
			if (User.exists?(id: enr.user_id))
				if (Car.exists?(id: enr.car_id))
					car=Car.find(enr.car_id)
					user_id=car.user_id
					user=User.find(user_id)
					user=user.email
					car=car.id
					@cars[user]=car
				end
			end	
		end

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
	def classfwd
		@fwd=Hash.new
		@fwdcars=Hash.new
		@event=Event.find(params[:id])
		@event.results.each do |stat|
			value=stat.user_result.to_f
			user=User.find(stat.visitor_id)
			@fwd[user.email]=value
		end	
		@event.enrollments.each do |enr|
			if (User.exists?(id: enr.user_id))
				if (Car.exists?(id: enr.car_id))
					car=Car.find(enr.car_id)
					if(car.wheeldrive=="front")
						user_id=car.user_id
						user=User.find(user_id)
						user=user.email
						car=car.id
						@fwdcars[user]=car
					end
				end	
			end
		end	
	end
	def classrwd
		@rwd=Hash.new
		@rwdcars=Hash.new
		@event=Event.find(params[:id])
		@event.results.each do |stat|
			value=stat.user_result.to_f
			user=User.find(stat.visitor_id)
			@rwd[user.email]=value
		end	
		@event.enrollments.each do |enr|
			if (User.exists?(id: enr.user_id))
				if (Car.exists?(id: enr.car_id))
					car=Car.find(enr.car_id)
					if(car.wheeldrive=="rear")
						user_id=car.user_id
						user=User.find(user_id)
						user=user.email
						car=car.id
						@rwdcars[user]=car
					end
				end	
			end
		end	
	end
	def classawd
		@awd=Hash.new
		@awdcars=Hash.new
		@event=Event.find(params[:id])
		@event.results.each do |stat|
			value=stat.user_result.to_f
			user=User.find(stat.visitor_id)
			@awd[user.email]=value
		end	
		@event.enrollments.each do |enr|
			if (User.exists?(id: enr.user_id))
				if (Car.exists?(id: enr.car_id))
					car=Car.find(enr.car_id)
					if(car.wheeldrive=="all")
						user_id=car.user_id
						user=User.find(user_id)
						user=user.email
						car=car.id
						@awdcars[user]=car
					end
				end	
			end
		end	
	end
	def destroy
	end
	def result_params
		params.require(:result).permit(:user_result,:visitor_id)
	end
end
