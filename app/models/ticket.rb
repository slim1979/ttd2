class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id

  def station_shedule(type)
    RailwayStationsRoute.where(railway_station: send("#{type}_station_id"), route: route_id).first
  end

  def station(type)
    RailwayStation.find(send("#{type}_station_id"))
  end

  def train
    Train.find(train_id)
  end

  def route
    Route.find(route_id)
  end
end
