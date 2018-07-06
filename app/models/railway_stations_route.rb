class RailwayStation < ActiveRecord
  belongs_to :route
  belongs_to :railway_station  
end