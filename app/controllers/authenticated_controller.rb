class AuthenticatedController < ApplicationController
  
  before_action :check_profile_user

  def check_profile_user
    if current_user
      if current_user.first_name == nil || current_user.last_name == nil
        redirect_to complete_profile_path
      end
    end
  end

end
