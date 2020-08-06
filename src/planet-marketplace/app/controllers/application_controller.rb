class ApplicationController < ActionController::Base
  before_action :set_user

  def set_user
    @user = nil

    if(params[:user_id] != nil)
      @user = User.all.find(params[:user_id])
    end
  end

  # def after_sign_in_path_for(resource_or_scope)
  #   view_profile_path(current_user)
  # end

end