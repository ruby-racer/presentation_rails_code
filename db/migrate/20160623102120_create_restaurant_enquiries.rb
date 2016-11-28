class CreateRestaurantEnquiries < ActiveRecord::Migration
  def change
    create_table :restaurant_enquiries do |t|
      t.references :restaurant, null: false, index: true
      t.references :user, null: false, index: true
      t.date :date, null: false
      t.time :time, null: false
      t.text :message
      t.string :number_of_guests, null: false

      t.timestamps null: false
    end
  end
end
