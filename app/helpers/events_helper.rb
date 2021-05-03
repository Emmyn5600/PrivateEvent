module EventsHelper
  def show_event_list(events)
    out = ''
    events.each do |event|
      out += "<ul><li>Event Name: #{event.title}</li>"
      out += "<li>Description: #{event.description}</li>"
      out += "<li>Date: #{event.date}</li>"
      out += "<li>Location: #{event.location}</li></ul>"
    end
    out.html_safe
  end
end
