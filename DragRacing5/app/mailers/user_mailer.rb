class UserMailer < ApplicationMailer
	default from: 'theschoolregister@gmail.com'
	def welcome_email(user)
    	@user = user
    	#@url  = 'http://localhost:3000/events/:id/enrollments/new'
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site') 
  end
end
