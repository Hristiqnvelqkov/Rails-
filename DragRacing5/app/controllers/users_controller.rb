class UsersController < ApplicationController
	before_action :authenticate_user!
	def userpage
		@user=User.find(params[:id])
	end	
	def show
		@user=User.find(params[:id])
		if(@user.id!=current_user.id)
			render :userpage
		end
	end	
	def all
		@members=Array.new
		@members=User.all
		#member.each do |mem|
		#@members<<mem.email	
		#end
	end
	def myevents
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
