class TransportationsController < ApplicationController
  def index
  end

  def new
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.new(params_transportation)
    if @transportation.save
      redirect_to root_path
    else
      redirect_to new_trip_transportation_path
    end
  end

  private

  def params_transportation
    params[:transportation].permit(:transportation_type, :reference_number, :link, :departure_datetime, :arrival_time, :departure_city, :company)
  end
end
