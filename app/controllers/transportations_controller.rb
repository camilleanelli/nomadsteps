class TransportationsController < AuthenticatedController

  def index
    @trip = current_user.trips.find(params[:trip_id])
    @transportations = @trip.transportations.includes(:tickets)
  end

  def show
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:id])
  end

  def edit
    @trip = current_user.trips.find(params[:trip_id])
    @users = @trip.users
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
    @users = @trip.users
    @transportation = @trip.transportations.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.create(params_transportation)

    if @transportation.save
      flash[:notice] = "Transportation successfully created !"
      redirect_to trip_transportations_path(@trip)
    else
      flash[:alert] = "Please correct your answers"
      redirect_to new_trip_transportation_path(@trip)
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
    params[:transportation].permit(:transportation_type, :reference_number, :link, :departure_datetime, :departure_city, :company, :price, :arrival_datetime, :return_date_departure, :return_date_arrival, :user_ids => [])
  end
end
