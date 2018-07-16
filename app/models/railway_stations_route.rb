class RailwayStationsRoute < ApplicationRecord
  belongs_to :route
  belongs_to :railway_station

  # validates :station_index, uniqueness: { scope: :route_id }
  validates :railway_station_id, uniqueness: { scope: :route_id }
end
