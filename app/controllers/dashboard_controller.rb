class DashboardController < AuthenticatedController

  def show
    @user = current_user
    @trips = @user.trips.includes(:transportations, :accomodations, :users, :trips_users)

    @last_trips = current_user.last_trips
    @current_trip = current_user.current_trip
    @next_trips = current_user.next_trips
    @next_trip = current_user.next_trips.first
    @trips_dashboard = [ @current_trip, @next_trip ]
  end
end
