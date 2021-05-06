module UserHelper
  # rubocop:disable Layout/LineLength
  def show_user_event_list(events)
    out = ''
    events.each do |event|
      out += '<div class="box">'
      out += "<ul class=\"is-flex is-justify-content-space-between is-align-content-center\"><li class=\"mt-2 has-text-weight-bold\">#{event.title}</li>"
      out += "<li>#{link_to 'More Informations', event_url(event), class: 'button is-primary is-outlined'}</li></ul>"
      out += '</div>'
    end
    out.html_safe
  end

  def user_upcoming_events
    out = ''
    @user_attendance.each do |attendance|
      out += "<li class=\"ml-6\">#{attendance.title}</li>" if attendance.date > Time.now
    end
    out.html_safe
  end

  def user_past_events
    out = ''
    @user_attendance.each do |attendance|
      out += "<li class=\"ml-6\">#{attendance.title}</li>" if attendance.date < Time.now
    end
    out.html_safe
  end

  def no_created_events
    out = ''
    if show_user_event_list(@user_events).empty?
      out += link_to "You haven't created any events, click here to create one", new_event_path, class: 'ml-5'
    end
    out.html_safe
  end

  def no_upcoming_events
    out = ''
    if user_upcoming_events.empty?
      out += link_to "You don't have any events to attend, click here to search for one", root_path, class: 'ml-5'
    end
    out.html_safe
  end

  def no_past_events
    out = ''
    out += "<p class=\"ml-5\">You didn't attend any events so far.</p>" if user_past_events.empty?
    out.html_safe
  end
end
# rubocop:enable Layout/LineLength
