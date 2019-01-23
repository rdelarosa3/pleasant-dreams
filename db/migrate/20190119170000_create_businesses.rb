class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :messenger
      t.integer :zipcode
      t.string :email
      t.string :facebook
      t.string :instagram
      t.string :youtube
      t.string :twitter
      t.string :logo
      t.string :hashtag
      t.text :bio
      t.text :tattoo
      t.text :piercing
      t.text :product
      t.string :operator

      t.timestamps
    end
  end
end
