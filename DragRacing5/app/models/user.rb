class User < ActiveRecord::Base
  acts_as_voter
  devise :registerable, :confirmable
  has_many :enrollments
  has_many :events
  has_many :comments
  has_many :cars
  has_many :results
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
