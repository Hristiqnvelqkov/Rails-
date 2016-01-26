class UserMailer < ApplicationMailer
	default from: 'theschoolregister@gmail.com'
	def welcome_email(user,user1)
    	@user = user
    	@user1= user1
    	#@url  = 'http://localhost:3000/events/:id/enrollments/new'
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site') 
  end
  	def digest_email(user)
    	@visitor = user
    	#@url  = 'http://localhost:3000/events/:id/enrollments/new'
    	mail(to: @visitor.email, subject: 'LUdaaak') 
  	end	
end
