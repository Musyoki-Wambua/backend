class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :location
      t.string :image_url
      t.string :interests
      t.date :date_of_birth
      t.integer :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
