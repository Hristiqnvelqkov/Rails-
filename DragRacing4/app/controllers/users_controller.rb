class UsersController < ApplicationController
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
end
