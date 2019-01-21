class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :last_name
      t.string :first_name
      t.string :email, null: false
      t.date :birthday
      t.string :phone_number
      t.integer :role, default: 0
      t.references :title, foreign_key: true
      t.string :instagram
      t.string :facebook
      t.string :linkedin
      t.string :avatar
      t.string :hashtag
      t.text :bio
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
