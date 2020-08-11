class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_profile, only: [:view, :edit, :update]
  # before_action :get_listings, only: [:view]
  # before_action :get_planets, only: [:view]

  def view
    @profile.user_id == current_user.id ? @is_user = true : @is_user = false
    @current_listings = Listing.where(seller_id: @profile.user_id, sold: false)
    @owned_planets = Planet.where(user_id: @profile.user_id)
    @past_listings = Listing.where(seller_id: @profile.user_id, sold: true)
    @user_purchases = Listing.where(buyer_id: @profile.user_id)
  end

  def edit
    
  end

  def new
    @profile = Profile.new
    @profile.user_id = current_user
  end

  def create  
    @profile = Profile.new(profile_params)

    # @users = User.all
    @profile.update_attribute(:user_id, current_user.id)
    @profile.update_attribute(:credits, 10000)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to view_profile_path(@profile), notice: 'profile was successfully created.' }
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
        format.html { redirect_to update_patch_profile_path(@profile), notice: 'Profile was successfully updated.' }
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

  def get_profile
    @profile = Profile.find(params[:id])
  end

  # def get_listings
  #   @listings = Listing.all
  # end

  # def get_planets
  #   @planets = Planet.all
  # end

end
