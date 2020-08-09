class AddSoldBoolToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :sold, :boolean
  end
end
