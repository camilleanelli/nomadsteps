class PublicProfileController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:user_id])
    @trips = @user.trips.order(start_date: :desc).includes(:trips_users, :users, :accomodations, :transportations)
    @current_trip = @user.current_trip
  end

  private


end
