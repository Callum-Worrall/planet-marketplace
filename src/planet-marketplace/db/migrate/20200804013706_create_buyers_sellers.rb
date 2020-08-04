class CreateBuyersSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_sellers do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
