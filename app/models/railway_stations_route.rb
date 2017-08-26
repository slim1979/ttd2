class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_index, uniqueness: { scope: :route }
  before_validation :set_index

  private

  def set_index
    self.railway_station_index ||= railway_station_id
  end
end
