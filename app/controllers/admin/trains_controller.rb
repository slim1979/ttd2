class Admin::TrainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_train, only: %i[show edit update destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show; end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit; end

  # POST /trains
  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to [:admin, @train], notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trains/1
  def update
    if @train.update(train_params)
      redirect_to [:admin, @train], notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trains/1
  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_train
    @train = Train.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def train_params
    params.require(:train).permit(:number, :current_station_id, :route_id, :sort_by, :van_type_to_more_info, :places_type_to_more_info)
  end
end