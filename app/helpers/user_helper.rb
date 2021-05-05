module UsersHelper
  def show_event_list(events)
    out = ''
    events.each do |event|
      out += "<ul><li><strong>Event Name:</strong> #{event.name}</li>"
      out += "<li>Description: #{event.description}</li>"
      out += "<li>Date: #{event.date}</li>"
      out += "<li>Location: #{event.location}</li></ul>"
    end
    out.html_safe
  end
  
  def display_events(events, partial_to_render, title_to_display) 
    render partial: partial_to_render, locals: { events: events, title: title_to_display } 
    if events.size.positive? 
  end 
end