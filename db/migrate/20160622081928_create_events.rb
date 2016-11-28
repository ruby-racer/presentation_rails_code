class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :main_image
      t.integer :position, default: 0
      t.integer :zone
      t.string :address
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

    add_index :events, :name, unique: true
    add_index :events, :slug, unique: true
  end
end
