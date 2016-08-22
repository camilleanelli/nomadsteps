class TicketsController < ApplicationController

  def index
  end

  def new
    @trip = current_user.trips.params[:trip_id]
    @transportation = @trip.transportations.params[:transportation_id]
    @ticket = @transportation.tickets.new
  end

  def create
  end

  private

end
