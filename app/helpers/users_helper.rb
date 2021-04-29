module UsersHelper
  def upcoming_events
    out = ''
    if attendance.date > Time.now
      out << (attendance.title)
    end
    out.html_safe
  end
end
