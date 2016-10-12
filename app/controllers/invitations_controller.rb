class InvitationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.invite!(params_invitation)
    @trip = current_user.trips.find(params[:trip_id])
    @trip.users << @user
    redirect_to trips_path
  end

  private

  def params_invitation
    params[:user].permit(:email)
  end
end
