class DashboardController < AuthenticatedController

  def show
    @user = current_user
    @trips = current_user
      .trips
      .includes(:trips_users, :users, :accomodations, :transportations)
      .order(:start_date)

    @current_trip = current_trips.first
    @next_trip = next_trips.first
    last_trip
    @last_trip = @last_trips.last
    @trips_dashboard = [ @current_trip, @next_trip ]
  end

  private

  def current_trips
    # @trips.where('start_date < Date.today AND end_date > Date.today', start_date: params[:start_date], end_date: params[:end_date])
    current_trips = []
    @trips.each do |trip|
      current_trips.push trip if trip.start_date < Date.today && trip.end_date > Date.today
    end
    current_trips
  end

  def next_trips
    next_trips = []
    if !@current_trip
      @trips.each do |trip|
        if trip.start_date >= Date.today
          next_trips << trip
        end
      end
      next_trips
    else
      @trips.each do |trip|
        if trip.start_date >= @current_trip.end_date
          next_trips << trip
        end
      end
      next_trips
    end
  end

  def last_trip
    @last_trips = []
    if !@current_trip
      @trips.each do |trip|
        if trip.end_date <= Date.today
          @last_trips << trip
        end
      end
    else
      @trips.each do |trip|
        if trip.end_date <= @current_trip.start_date
          @last_trips << trip
        end
      end
    end
  end

end
