class Train < ApplicationRecord
  validates :number, presence: true

  has_many :carriages
  has_many :tickets
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  validates :order_carriage, inclusion: { in: [true, false] }

  def self.order_carriage
    true
  end

  def seats_by_type(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
