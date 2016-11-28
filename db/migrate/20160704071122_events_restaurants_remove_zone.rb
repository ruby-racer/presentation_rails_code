class EventsRestaurantsRemoveZone < ActiveRecord::Migration
  def change
    remove_column :events, :zone
    remove_column :restaurants, :zone
  end
end
