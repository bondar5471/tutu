class Route < ApplicationRecord
  validates :name, presence:  true
  validate :stations_count
  before_validation :set_name

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  private
  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен состоять минимум с 2х станций")
    end
  end
end
