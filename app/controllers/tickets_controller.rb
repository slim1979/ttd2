class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show destroy]

  def new
    @ticket = Ticket.new
    @ticket.route_id = params[:route_id]
    @ticket.start_station_id = params[:start_station_id]
    @ticket.finish_station_id = params[:finish_station_id]
    @ticket.train_id = params[:train_id]
  end

  def index
    @tickets = Ticket.where(user: current_user)
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show; end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Билет был успешно удален.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:start_station_id, :finish_station_id, :train_id, :route_id, :first_name, :last_name, :passport_serial, :passport_number)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
