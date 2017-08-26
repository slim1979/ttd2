class Search < ApplicationRecord
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id

  def routes
    start_station_routes = RailwayStationsRoute.where(railway_station: start_station)
    finish_station_routes = RailwayStationsRoute.where(railway_station: finish_station)
    start_station_routes.map(&:route) & finish_station_routes.map(&:route)
  end
end
