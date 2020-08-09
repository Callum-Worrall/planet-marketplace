class AddPriceFloatToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :price, :float
  end
end
