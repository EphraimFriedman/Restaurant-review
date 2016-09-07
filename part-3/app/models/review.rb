class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :rating, :body, :restaurant, :author, presence: true

  validates :author, uniqueness: { scope: :restaurant}


end
