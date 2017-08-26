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

  def set_time_for(type, value)
    station = access_to_shedule
    method = "#{type}_at="
    station.send method, value
    station.save
  end

  def show_time_for(type)
    station = access_to_shedule
    method = "#{type}_at"
    station.send method
  end

  def update_shedule(arrival_at, departure_at)
    stations = access_to_collection_shedule
    stations.each do |station|
      station.update(arrival_at: arrival_at, departure_at: departure_at)
    end
  end

  def time
    hours = rand(0..23)
    minutes = rand(0..59)
    hours = [0, hours].join if hours < 10
    minutes = [0, minutes].join if minutes < 10
    "#{hours}:#{minutes}"
  end

  protected

  def access_to_shedule
    railway_stations_routes.first
  end

  def access_to_collection_shedule
    railway_stations_routes
  end
end
