class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :increase, -> { joins(:railway_stations_routes).order('railway_stations_routes.railway_station_index').uniq }
  scope :decrease, -> { joins(:railway_stations_routes).order('railway_stations_routes.railway_station_index DESC').uniq }

  def set_index_on(route, index)
    station = station(route)
    station.update(railway_station_index: index) if station
  end

  def show_index_on(route)
    station(route).try(:railway_station_index)
  end

  def set_time_for(type, station)
    method = "#{type}_at="
    station.send method, time
    station.save
  end

  def show_time_for(type, route)
    station = station(route)
    set_time_for(type, station)
    method = "#{type}_at"
    station.send method
  end

  def time
    hours = rand(0..23)
    minutes = rand(0..59)
    hours = [0, hours].join if hours < 10
    minutes = [0, minutes].join if minutes < 10
    "#{hours}:#{minutes}"
  end

  protected

  def station(route)
    railway_stations_routes.where(route: route).first
  end
end
