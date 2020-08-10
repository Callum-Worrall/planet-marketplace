class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  def self.get_username(user_id)
    Profile.where(user_id: user_id).each { |profile| return profile.username }
    return "!No Profile Found!"
  end

end
