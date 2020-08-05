class ApplicationController < ActionController::Base
  before_action :set_user

  def set_user
    @user = nil

    if(params[:user_id] != nil)
      @user = User.all.find(params[:user_id])
    end

  end

end
