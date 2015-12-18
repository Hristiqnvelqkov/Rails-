class Event < ActiveRecord::Base
	has_many :users
	has_many :comments
	 validates :title, :presence => true
	 validates :adress, :presence => true
	 validates :description, :presence => true
end

