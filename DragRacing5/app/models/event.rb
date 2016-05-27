class Event < ActiveRecord::Base
	  acts_as_votable
	  geocoded_by :adress
	  after_validation :geocode
	has_many :results
	has_many :users
	has_many :enrollments
	has_many :comments
	 validates :title, :presence => true
	 validates :adress, :presence => true
	 validates :description, :presence => true
	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    has_attached_file :video, :styles => {
    :medium => { :geometry => "640x480", :format => 'mp4' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:ffmpeg]
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
# 	def self.search(search)
# 		if search
#     		find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
#   		else
#     		find(:all)
#   		end
# 	end

  self.per_page = 5
# set per_page globally
 end