module ApplicationHelper
  #Make time look pretty
  def pretty_time(time)
    time.strftime("%d %B %Y - %H:%M")
  end
end
