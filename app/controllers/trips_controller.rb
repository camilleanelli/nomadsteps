class TripsController < AuthenticatedController
  before_action :get_trip, only: [:edit, :update, :destroy]

  def index
    @trips = current_user.trips.includes(:transportations, :accomodations, :users, :trips_users).order(start_date: :desc).page(params[:page])
  end

  def edit
    @place = Nomadlist::City.find(params[@trip.city_details]).result[0]
  end

  def update
    @trip.update(params_trips)
    if @trip.save
      flash[:notice] = "Your trip has been successfully updated"
      redirect_to trips_path
    else
      render :new
    end
  end

  def new
    @trip = current_user.trips.new
  end

  def create
 params_trips["google_info"] = JSON.parse(params_trips["google_info"]) if params_trips["google_info"]
    @trip = Trip.new(params_trips)

    if @trip.save
      current_user.trips << @trip
      flash[:notice] = "Your trip has been successfully created"
      redirect_to trips_path
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def get_trip
    @trip = current_user.trips.find(params[:id])
  end

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination, :longitude, :latitude, :cloudinary_id, :person_number, :image_trip, :city_details, :google_info, :country_name, :city_name)
  end


end
