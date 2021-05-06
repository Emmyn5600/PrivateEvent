module ApplicationHelper
  def notice_flash
    out = ''
    if flash[:notice]
      out += '<div class="notification is-link global-notification mb-0">'
      out += "<p class=\"notice\"> #{notice}</p>"
      out += '</div>'
    end
    out.html_safe
  end

  def alert_flash
    out = ''
    if flash[:alert]
      out += '<div class="notification is-danger global-notification mb-0">'
      out += "<p class=\"alert\"> #{alert}</p>"
      out += '</div>'
    end
    out.html_safe
  end

  def navbar_user_control
    out = ''
    if user_signed_in?
      out += '<p>'
      out += link_to 'Create Event', new_event_url, class: 'button ml-2 is-primary is-inverted'
      out += '</p>'
      out += '<p>'
      out += link_to 'Your events', user_path(current_user), class: 'button ml-2 is-primary has-text-weight-bold' 
      out += '</p>'
      out += '<p>'
      out += link_to current_user.username, edit_user_registration_path, class: 'button ml-2 is-primary'
      out += '</p>'
      out += '<p>'
      out += link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button ml-2 is-primary'
    else
      out += '</p>'
      out += '<p>'
      out += link_to 'Log In', new_user_session_path, class: 'button is-primary'
      out += '</p>'
      out += '<p>'
      out += link_to 'Sign Up', new_user_registration_path, class: 'button is-primary'
      out += '</p>'
    end
    out.html_safe
  end
end
