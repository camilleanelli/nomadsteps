module ApplicationHelper

  def avatar_navbar
    if current_user.filepicker_url?
      filepicker_image_tag current_user.filepicker_url, {w: 25, h: 25, fit: 'crop'}, class:"img-circle"
    else
      image_tag("user.png")
    end
  end
end
