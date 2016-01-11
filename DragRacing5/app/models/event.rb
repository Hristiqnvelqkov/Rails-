class Event < ActiveRecord::Base
	  acts_as_votable
	has_many :users
	has_many :enrollments
	has_many :comments
	 validates :title, :presence => true
	 validates :adress, :presence => true
	 validates :description, :presence => true
end

