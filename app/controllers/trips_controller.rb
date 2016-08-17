class TripsController < ApplicationController

  def index
    @trips = current_user.trips.all
  end

  def edit
    @trip = current_user.trips.find(params[:id])
  end

  def update
    @trip = current_user.trips.find(params[:id])
    @trip.update(params_trips)
    redirect_to root_path
  end

  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = current_user.trips.new(params_trips)
    if @trip.save
      redirect_to trips_path
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy
    redirect_to root_path
  end

  private

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination, :longitude, :latitude)
  end
end
