class AddPositionToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :position, :integer 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
