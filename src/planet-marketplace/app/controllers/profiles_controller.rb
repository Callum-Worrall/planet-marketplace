class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:view, :edit]

  def view
  end

  def edit
  end

  def new
    @user = current_user
    @profile = Profile.new
    @profile.user_id = @user.id
  end

  def create  
    @profile = Profile.new(profile_params)

    # @users = User.all
    @profile.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to view_profile_path(@profile.id), notice: 'profile was successfully created.' }
        format.json { render :view, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :bio, :picture)
  end

  def set_profile
    @profile = Profile.find_by user_id: current_user.id
  end

end
