class AddArrivalDepartureTimeToRailwayStations < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_at, :string
    add_column :railway_stations_routes, :departure_at, :string
  end
end
