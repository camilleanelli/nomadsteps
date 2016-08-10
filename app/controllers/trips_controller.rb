class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params_trips)
    if @trip.save
      redirect_to trips_path
    end
  end

  private

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination)
  end
end
