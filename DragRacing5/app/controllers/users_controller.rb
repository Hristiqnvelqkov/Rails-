class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user=User.find(params[:id])
	end	
	def all
		@members=Array.new
		member=User.all
		member.each do |mem|
		@members<<mem.email	
		end
	end
	def myevents
		@myallevents=Array.new
		current_user.events.each do |m|
			@myallevents<<m
		end		
	end
end