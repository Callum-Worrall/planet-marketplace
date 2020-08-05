class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|      
      t.references :planet, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
