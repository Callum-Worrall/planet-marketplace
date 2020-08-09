class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :buyer, class_name: "User"

  has_many :planet

end
