class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: %i[edit update destroy]

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit; end

  def filled_from_search
    @ticket = Ticket.new
    @ticket.route_id = params[:route_id]
    @ticket.start_station_id = params[:start_station_id]
    @ticket.finish_station_id = params[:finish_station_id]
    @ticket.train_id = params[:train_id]
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Билет успешно изменен.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Билет был успешно удален.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :start_station_id, :finish_station_id, :train_id, :route_id, :first_name, :last_name, :passport_serial, :passport_number)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
