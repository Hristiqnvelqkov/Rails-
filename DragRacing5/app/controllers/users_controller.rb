class UsersController < ApplicationController
	before_action :authenticate_user!
	def mygallery
		@pictures=Array.new	
		current_user.cars.each do |haha|
			@pictures<<haha.avatar
		end
	end
	def userpage
		@user=User.find(params[:id])
	end	
	def show
		@user=User.find(params[:id])
		if(@user.id!=current_user.id)
			render :userpage
		end
		@mypro="myprofile"
	end	
	def all
		@mem="userspage"
		@members=Array.new
		 if params[:search]
       	 name=params[:search]
        name.split(",").last
        @members=User.where(:email => name)
      else
        @members=User.all
      end
		#member.each do |mem|
		#@members<<mem.email	
		#end
	end
	def myevents
		@myev="myevents"
		@myallevents=Array.new
		current_user.events.each do |m|
			@myallevents<<m
		end

	end
	def userevents
		@user=User.find(params[:id])
		@userevents=Array.new
		@user.events.each do |m|
			@userevents<<m
		end
	end	
	 def usercars
	 	@user=User.find(params[:id])
	 end	
end
