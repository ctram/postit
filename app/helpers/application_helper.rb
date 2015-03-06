module ApplicationHelper
  def url_fixer(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end
  def display_datetime(dt)
    if logged_in?
      dt = dt.in_time_zone current_user.time_zone
    end
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
