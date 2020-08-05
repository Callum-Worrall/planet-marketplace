class BuyersSeller < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User"

end
