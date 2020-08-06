class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :username
      t.string :display_name
      t.text :bio
      t.float :credits

      t.timestamps
    end
  end
end
