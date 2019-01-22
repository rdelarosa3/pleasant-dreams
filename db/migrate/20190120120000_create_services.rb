class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :range

      t.timestamps
    end
  end
end
