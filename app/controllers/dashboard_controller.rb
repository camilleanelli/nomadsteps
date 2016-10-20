class DashboardController < ApplicationController

  def show
    @user = current_user
    @trips = current_user.trips.all.includes(:trips_users, :users, :accomodations, :transportations)
    current_trip
    next_trip
    @next_trip = @next_trips.first
  end

  private

  def current_trip
    @current_trip = []
    @trips.each do |trip|
      @current_trip.push trip if trip.start_date < Date.today && trip.end_date > Date.today
    end
  end

  def next_trip
    @next_trips = []
    @trips.each do |trip|
      if trip.start_date >= @current_trip.first.end_date
        @next_trips << trip
      end
    end
  end
end
