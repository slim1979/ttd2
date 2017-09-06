class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :route
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id

  validates :first_name, :last_name, :passport_serial, :passport_number, presence: true

  after_create :send_notification

  def station_shedule(type)
    RailwayStationsRoute.where(railway_station: send("#{type}_station_id"), route: route_id).first
  end

  def station(type)
    RailwayStation.find(send("#{type}_station_id"))
  end

  def confirmed_users
    users = []
    User.all.each { |user| users << user if user.confirmed? }
    users
  end

  def route_title
    "#{start_station.title} - #{finish_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
