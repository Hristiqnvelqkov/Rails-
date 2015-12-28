class User < ActiveRecord::Base
  acts_as_voter
  has_many :events
  has_many :comments
  has_many :cars

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
