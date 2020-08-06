class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_one :profile, dependent: :destroy
  has_many :listings_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :listings_to_sell, class_name: "Listing", foreign_key: "seller_id"
  

end
