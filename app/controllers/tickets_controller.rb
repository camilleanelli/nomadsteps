class TicketsController < AuthenticatedController

  def index
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:transportation_id])
    @tickets = @transportation.tickets
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
      redirect_to trip_transportations_path
    else
      render :new
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:trip_id])
    @transportation = @trip.transportations.find(params[:transportation_id])
    @ticket = @transportation.tickets.find(params[:id])
    @ticket.destroy
    redirect_to trip_transportations_path
  end

  private

  def params_tickets
    params[:ticket].permit(:cloudinary_id, :transportation_id, :filepicker_url)
  end

end
