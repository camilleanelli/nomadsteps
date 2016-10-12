class CompleteProfileController < AuthenticatedController
skip_before_action :check_profile_user

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params_complete_profile)
      redirect_to trips_path
    else
      render :complete_profile
    end
  end

private

  def params_complete_profile
    params[:user].permit(:first_name, :last_name, :nomadlist_username)
  end
end
