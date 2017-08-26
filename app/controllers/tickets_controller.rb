class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def filled_from_search
    @ticket = Ticket.new
    @ticket.user_id = params[:user_id]
    @ticket.route_id = params[:route_id]
    @ticket.start_station_id = params[:start_station_id]
    @ticket.finish_station_id = params[:finish_station_id]
    @ticket.train_id = params[:train_id]
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :start_station_id, :finish_station_id, :train_id, :route_id, :first_name, :last_name, :passport_serial, :passport_number)
  end
end
