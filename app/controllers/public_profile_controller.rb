class PublicProfileController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @trips = @user.trips.order(start_date: :desc).includes(:trips_users, :users, :accomodations, :transportations)
  end
end
