class AccomodationsController < AuthenticatedController

  def index
    @trip = current_user.trips.find(params[:trip_id])
    @accomodations = @trip.accomodations.order(:start_date)
    @lat = @accomodations.first.latitude
    @long = @accomodations.first.longitude
  end

  def new
    @trip = current_user.trips.find(params[:trip_id])
    @users = @trip.users
    @accomodation = @trip.accomodations.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.new(accomodation_params)
    if @accomodation.save
      flash[:notice] = 'Accommodation successfully created !'
      redirect_to trips_path
    else
      flash[:alert] = 'Please correct your answers'
      render :new
    end
  end

  def edit
    @trip = current_user.trips.find(params[:trip_id])
    @users = @trip.users
    @accomodation = @trip.accomodations.find(params[:id])

  end

  def update
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.find(params[:id])
    @accomodation.update(accomodation_params)
    if @accomodation.save
      flash[:notice] = "Accomodation successfully updated !"
      redirect_to trip_accomodations_path
    else
      render :new
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:trip_id])
    @accomodation = @trip.accomodations.find(params[:id])
    if @accomodation.destroy
      flash[:notice] = 'Accommodation successfully removed'
      redirect_to trips_path
    else
      render :index
    end
  end

  private

  def accomodation_params
    params[:accomodation].permit(:accomodation_type, :start_date, :end_date, :price, :link, :number_of_persons, :trip_id, :contact, :address, :longitude, :latitude, :contact_phone, :contact_email, :contact_name, :user_ids => [])
  end
end
