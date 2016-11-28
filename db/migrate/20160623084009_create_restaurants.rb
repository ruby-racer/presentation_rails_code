class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :zone
      t.string :address
      t.string :main_image
      t.integer :position, default: 0
      t.boolean :visible
      t.string :slug
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.text :atmosphere
      t.text :music
      t.text :style
      t.timestamps null: false
    end

    add_index :restaurants, :name, unique: true
    add_index :restaurants, :slug, unique: true
  end
end
