class PublicProfileController < AuthenticatedController
  skip_before_action :authenticate_user!
  skip_before_action :check_profile_user

  def show
    @user = User.find(params[:user_id])
    @trips = @user.trips.order(start_date: :desc).includes(:trips_users, :users, :accomodations, :transportations)
    @current_trip = @user.current_trip
  end

  private


end
