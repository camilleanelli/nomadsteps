module ProfileHelper

  def button_upload_profile_picture
    if current_user.filepicker_url?
      "Change your picture <i class='fa fa-camera' aria-hidden='true'></i>"
    else
      "Upload a picture <i class='fa fa-camera' aria-hidden='true'></i> "
    end
  end

  def button_nomadlist_username
    if current_user.nomadlist_username == ""
      "<i class='fa fa-plus' aria-hidden='true'></i> Add your Nomadlist username".html_safe
    else
      "Your Nomadlist username"
    end
  end
end
