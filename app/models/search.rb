class Search < ApplicationRecord
  belongs_to :user

  def routes
    routes = []
    Route.all.each do |route|
      stations = route.railway_stations.map(&:id)
      start_station = stations.include?(start_station_id)
      finish_station = stations.include?(finish_station_id)
      routes << route if start_station && finish_station
    end
    routes
  end
end
