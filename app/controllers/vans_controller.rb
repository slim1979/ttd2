class VansController < ApplicationController
  before_action :set_train

  def index
    @vans = @train.vans
  end

  # GET /vans/1
  def show
    @van = @train.vans.find(params[:id])
  end

  # GET /vans/new
  def new
    @train = Train.find(params[:train_id])
    @van = Van.new
  end

  # GET /vans/1/edit
  def edit
    @van = @train.vans.find(params[:id])
  end

  # POST /vans
  def create
    @van = @train.vans.new(van_params)

    if @van.save
      redirect_to @train, notice: 'Вагон успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /vans/1
  def update
    @van = @train.vans.find(params[:id])
    if @van.update(van_params)
      redirect_to @train, notice: 'Вагон успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /vans/1
  def destroy
    @van.destroy
    redirect_to vans_url, notice: 'Вагон удален. Жаль его. Он был так молод...'
  end

  private

  # Use callbacks to share common setup or consvants between actions.
  def set_train
    @train = Train.find(params[:train_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def van_params
    params.require(:van).permit(:van_kind_id, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seats, :train_id, :type)
  end
end
