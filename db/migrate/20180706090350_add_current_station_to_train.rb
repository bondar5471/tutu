class AddCurrentStationToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :current_station_id, :integer
  end
end
