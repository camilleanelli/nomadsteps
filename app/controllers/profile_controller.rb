class ProfileController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params_profile)
      redirect_to trips_path
    end
  end

  private

  def params_profile
    params[:user].permit(:first_name, :last_name, :email, :nomadlist_username)
  end
end
