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

  protected

  def station(route)
    railway_stations_routes.where(route: route).first
  end
end
