class DashboardController < AuthenticatedController

  def show
    @user = current_user
    @trips = current_user
      .trips
      .includes(:trips_users, :users, :accomodations, :transportations)
      .order(:start_date)

    @last_trips = last_trips
    @current_trip = current_user.current_trips.first
    @next_trips = next_trips
    @next_trip = next_trips.first
    @trips_dashboard = [ @current_trip, @next_trip ]
  end

  private


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

  def last_trips
    last_trips = []
    if @current_trip == nil
      @trips.each do |trip|
        if trip.end_date < Date.today
          last_trips << trip
        end
      end
      last_trips
    else
      @trips.each do |trip|
        if trip.end_date < @current_trip.start_date
          last_trips << trip
        end
      end
      last_trips
    end
  end

end
