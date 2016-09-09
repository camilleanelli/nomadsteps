class TransportationsController < ApplicationController
  def index
  end

  def show
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:id])
  end

  def edit
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:id])
  end

  def update
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:id])
    @transportation.update(params_transportation)
    redirect_to trips_path
  end

  def new
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.new(params_transportation)

    if @transportation.save!
      redirect_to trip_transportation_path(@trip, @transportation)
    else
      render :new
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:id])
    @transportation.destroy
    redirect_to trips_path
  end

  private

  def params_transportation
    params[:transportation].permit(:transportation_type, :reference_number, :link, :departure_datetime, :departure_city, :company, :price, :arrival_datetime)
  end
end
