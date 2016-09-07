class User < ActiveRecord::Base
  
  validates :name, :password, presence: true
  validates :username, :email, presence: true, uniqueness: true 


  has_secure_password
end
