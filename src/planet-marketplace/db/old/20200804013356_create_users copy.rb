class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password
      t.string :display_name
      t.text :bio
      t.float :credits

      t.timestamps
    end
  end
end
