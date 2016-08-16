class TripsController < ApplicationController

  def index
    @trips = current_user.trips.all
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

  private

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination, :longitude, :latitude)
  end
end
