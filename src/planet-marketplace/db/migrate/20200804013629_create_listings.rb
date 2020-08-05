class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|      
      t.references :planet, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :seller_id
      t.integer :buyer_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
