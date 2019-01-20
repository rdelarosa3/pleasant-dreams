class CreateArtistWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_works do |t|
      t.references :user, index: true
      t.references :promotion, index: true
      t.string :remarks
      t.timestamps
    end
  end
end