class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { order(:number) } # сортировка по номеру пока не добавил в вид нет в задании
end
