class ApplicationController < ActionController::Base
  before_action :set_profile

  # def set_user
  #   @user = nil

  #   if(params[:user_id] != nil)
  #     @user = User.all.find(params[:user_id])
  #   end
  # end

  def set_profile
    # @profile = nil
    if(user_signed_in?)
      @profile = Profile.find_by user_id: current_user.id
    end
  end


  # def after_sign_in_path_for(resource_or_scope)
  #   view_profile_path(current_user)
  # end

end