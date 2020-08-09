class Planet < ApplicationRecord
  has_one :owner, required: false
  has_one_attached :picture
  
end
