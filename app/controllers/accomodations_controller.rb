class AccomodationsController < ApplicationController

  def index
    @trip = current_user.trips.find(params[:trip_id])
    @accomodations = @trip.accomodations
    @lat = @accomodations.first.latitude
    @long = @accomodations.first.longitude
  end

  def new
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.new(accomodation_params)
    if @accomodation.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.find(params[:id])

  end

  def update
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.find(params[:id])
    @accomodation.update(accomodation_params)
    redirect_to trips_path
  end

  def destroy
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.find(params[:id])
    @accomodation.destroy
    redirect_to trips_path
  end

  private

  def accomodation_params
    params[:accomodation].permit(:accomodation_type, :start_date, :end_date, :price, :link, :number_of_persons, :trip_id, :contact, :address, :longitude, :latitude )
  end
end
