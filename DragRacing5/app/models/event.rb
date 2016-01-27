class Event < ActiveRecord::Base
	  acts_as_votable
	has_many :results
	has_many :users
	has_many :enrollments
	has_many :comments
	 validates :title, :presence => true
	 validates :adress, :presence => true
	 validates :description, :presence => true
	def self.send_digest_email
	  	event=Event.all
	  	event.each do |haha|
	      	if(Date.parse(haha.date.strftime('%Y-%m-%d %H:%M')) > Date.today+2)
	          	haha.enrollments.each do |haha1|
	       	 		UserMailer.digest_email(haha1.user).deliver_now
	        	end
	       	end
	    end
	end
end