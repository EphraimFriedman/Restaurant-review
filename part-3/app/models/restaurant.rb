class Restaurant < ActiveRecord::Base
  
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :reviews

  validates :name, :address, :city, :state, :cuisine, :author, presence: true
  validates :zip, presence: true, length: {minimum: 5, maximum: 5}


  def average_ratings
  	total = self.reviews.reduce(0) {|sum, review| sum + review.rating }
  	return 'no ratings' if total == 0
  	total / self.reviews.count
  	
  end

  def already_reviewed(user)
    self.reviews.find {|review| review.author == user }      
  end
end
