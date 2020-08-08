class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:view, :edit, :update]
  before_action :set_listings, only: [:view]

  def view
    @profile.user_id == current_user.id ? @is_user = true : @is_user = false
  end

  def edit
  end

  def new
    @profile = Profile.new
    @profile.user_id = current_user.id
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

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to update_patch_profile_path(@profile.id), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :username, :bio, :picture)
  end

  def set_profile
    @profile = Profile.find_by user_id: current_user.id
  end

  def set_listings
    @listings = Listing.all
  end

end
