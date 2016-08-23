class TicketsController < ApplicationController

  def index
  end

  def new
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:transportation_id])
    @ticket = @transportation.tickets.new
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:transportation_id])
    @ticket = @transportation.tickets.new(params_tickets)
    if @ticket.save!
      redirect_to trip_transportation_path(@transportation)
    else
      render :new
    end
  end

  private

  def params_tickets
    params[:ticket].permit(:cloudinary_id, :transportation_id)
  end

end
