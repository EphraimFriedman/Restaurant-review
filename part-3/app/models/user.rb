class User < ActiveRecord::Base
  has_many :restaurants
  has_many :reviews
  
  validates :name, :password, presence: true
  validates :username, :email, presence: true, uniqueness: true 


  has_secure_password
end
