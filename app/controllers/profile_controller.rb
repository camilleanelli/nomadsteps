class ProfileController < AuthenticatedController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params_profile)
      flash[:notice] = "Your profile has been successfully updated"
      redirect_to trips_path
    end
  end

  private

  def params_profile
    params[:user].permit(:first_name, :last_name, :email, :nomadlist_username, :filepicker_url)
  end
end
