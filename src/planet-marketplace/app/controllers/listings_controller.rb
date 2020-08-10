class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :get_listing, only: [:view, :edit, :update, :destroy, :purchase]
  before_action :get_seller, only: [:view, :edit, :destroy, :purchase]
  before_action :get_all_users_planets, only: [:view, :new, :create, :edit, :destroy]
  
  def home
    @listings = Listing.all
  end

  def view
    
  end

  def purchase
    buyer_profile = Profile.find_by(user_id: current_user.id)
    @listing.update_attribute(:sold, true)
    @listing.update_attribute(:buyer_id, current_user.id)
    @seller_profile.update_attribute(:credits, (@seller_profile.credits.to_i + @listing.price.to_i))
    buyer_profile.update_attribute(:credits, (buyer_profile.credits.to_i - @listing.price.to_i))

    respond_to do |format|
      if (can_purchase?(@seller_profile, buyer_profile, @listing) &&
        @listing.save &&
        @seller_profile.save &&
        buyer_profile.save)     
        puts "Purchase succeeded."   
        format.html { redirect_to view_listing_path(@listing.id), notice: 'Your purchase was successful!' }
        format.json { render :show, status: :ok, location: @listing }
        # format.json { render :show, status: :ok, location: buyer_profile }
        # format.json { render :show, status: :ok, location: @seller_profile }
      else
        puts "Purchase failed."
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def can_purchase?(seller_profile, buyer_profile, listing)
    if(seller_profile.user_id != buyer_profile.user_id && buyer_profile.profile.credits >= listing.price)
      return true
    else
      return false
    end
  end

  def new
    @listing = Listing.new
  end

  def create  
    @listing = Listing.new(listing_params)

    @listing.update_attribute(:user_id, current_user.id)
    @listing.update_attribute(:seller_id, current_user.id)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to view_listing_path(@listing.id), notice: "A listing has been successfully created." }
        format.json { render :view, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to update_patch_listing_path(@listing.id), notice: 'A listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to (current), notice: 'A listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listing_params
    params.require(:listing).permit(:title, :planet_id, :description, :price)
  end

  def get_seller
    @seller_profile = Profile.find_by user_id: @listing.seller_id
  end

  def get_all_planets
    @planets = Planet.all
  end

  def get_all_users_planets
    @planets = Planet.where(user_id: current_user.id)
  end

  def get_listing_planets
    @planets = Planet.where(id: get_listing.planet_id)
  end

  def get_listing
    @listing = Listing.find(params[:id])
  end
  
end
