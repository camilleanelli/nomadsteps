class TripsController < ApplicationController
  before_action :get_trip, only: [:edit, :update, :destroy]

  def index
    @trips = current_user.trips.order(:start_date).reverse
  end

  def edit
  end

  def update
    @trip.update(params_trips)
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @trip = current_user.trips.new
  end

  def create
    @trip = Trip.new(params_trips)

    if @trip.save
      current_user.trips << @trip
      redirect_to trips_path
    end
  end

  def destroy
    @trip.destroy
    redirect_to root_path
  end

  private

  def get_trip
    @trip = current_user.trips.find(params[:id])
  end

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination, :longitude, :latitude)
  end
end
