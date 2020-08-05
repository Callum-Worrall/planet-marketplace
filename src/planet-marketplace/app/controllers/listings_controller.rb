class ListingsController < ApplicationController

  def home
    @listings = Listing.all
  end

end
