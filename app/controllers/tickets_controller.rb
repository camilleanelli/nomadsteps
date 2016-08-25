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
      redirect_to trip_transportation_path(@trip, @transportation)
    else
      render :new
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:transportation_id])
    @ticket = @transportation.tickets.find(params[:id])
    @ticket.destroy
    redirect_to trip_transportation_path(@trip, @transportation)
  end

  private

  def params_tickets
    params[:ticket].permit(:cloudinary_id, :transportation_id, :filepicker_url)
  end

end
