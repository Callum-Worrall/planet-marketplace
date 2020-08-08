class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_seller, only: [:new, :create, :edit, :destroy]

  def view
    
  end

  def edit

  end

  def new
    @listing = listing.new
    @listing.seller_id = @seller.id
  end

  def create  
    @listing = listing.new(listing_params)

    # @profiles = profile.all
    @listing.update_attribute(:seller_id, @seller.id)

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
      format.html { redirect_to root_path, notice: 'A listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :picture)
  end

  # def set_listing
  #   @listings = listing.find_all seller_id: current_user.id
  # end

  def set_seller
    @user = current_user
  end

end
