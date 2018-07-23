class AddIndexToTrains < ActiveRecord::Migration[5.2]
  def change
    add_index :trains, :current_station_id
  end
end
