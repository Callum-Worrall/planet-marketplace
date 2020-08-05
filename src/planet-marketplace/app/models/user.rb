class User < ApplicationRecord
  has_many :listings_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :listings_to_sell, class_name: "Listing", foreign_key: "seller_id"

end
