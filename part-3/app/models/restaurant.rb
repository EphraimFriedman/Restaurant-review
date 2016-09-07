class Restaurant < ActiveRecord::Base
  
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :name, :address, :city, :state, :cuisine, :author, presence: true
  validates :zip, presence: true, length: {minimum: 5, maximum: 5}
end
