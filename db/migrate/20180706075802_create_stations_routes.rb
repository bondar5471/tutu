class CreateStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :railway_astations_routes do |t|
      t.belongs_to :railway_station, index: true
      t.belongs_to :route, index: true
    end
  end
end
