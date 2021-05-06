# rubocop:disable Layout/LineLength
module EventsHelper
  def show_event_list(events)
    out = ''
    events.each do |event|
      out += '<div class="box">'
      out += "<ul><li>#{link_to event.title, event_url(event), class: 'event-title'}</li>"
      out += "<li><b>Description:</b> #{event.description}</li>"
      out += "<li><b>Date:</b> #{event.date}</li>"
      out += "<li><b>Location:</b> #{event.location}</li></ul>"
      out += '</div>'
    end
    out.html_safe
  end

  def show_attendee_lists(_attendees)
    out = ''
    if user_signed_in?
      @event.attendees.each do |attendee|
        out += "<li class=\"ml-6\">#{attendee.username}</li>"
      end
    else
      out += '<button class="button is-primary" title="Disabled button" disabled>Sign up or Log in to attend this event</button>'
    end
    out.html_safe
  end

  def event_controls(event)
    out = '<div class="is-flex mb-3">'
    if user_signed_in? && current_user.id == event.creator_id
      out += link_to 'Edit', edit_event_path(@event), class: 'button is-warning is-outlined mr-2'
      out += button_to 'Delete', event, method: :delete, data: { confirm: 'Are you sure?' },
                                        class: 'button is-danger is-outlined mr-2'
    end
    out += link_to 'Home', events_path, class: 'button is-primary is-outlined'
    out += '</div>'
    out.html_safe
  end

  def attend_event_button
    out = ''
    if user_signed_in?
      out += '<form class="new_event_attendee" id="new_event_attendee" action="/event_attendees" accept-charset="UTF-8" method="post" >'
      out += '<input type="hidden" name="authenticity_token" value="LAtzzoaWGmtxNql4lgIOhs3O0UpH2sK-kE25RTTHI6R2QSJDJQmu6rbzOxSBgYWy36ufttSeOl7bUoTpksQZUA" >'
      out += '<input type="hidden" value="@event_id" name="event_attendee[attended_event_id]" id="event_attendee_attended_event_id" >'
      out += '<input type="submit" name="commit" value="Attend" data-disable-with="Attend">'
      out += '</form>'
    end
    out.html_safe
  end

  def attendance_or_cancel
    if user_signed_in? && current_user.attending?(@event)
      render 'cancel'
    else
      render 'attend'
    end
  end
end
# rubocop:enable Layout/LineLength
