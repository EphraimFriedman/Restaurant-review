class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :body, :restaurant, :author, presence: true

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1 }

  validates :author, uniqueness: { scope: :restaurant}


end
