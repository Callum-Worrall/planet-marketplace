class ApplicationController < ActionController::Base
  before_action :set_profile

  def set_profile
    if(user_signed_in?)
      @profile = Profile.find_by user_id: current_user.id

      if(@profile != nil)
        if(@profile.credits.to_i <= 0)
          @has_credits = false
        else
          @has_credits = true
        end
      end
    end
  end

end