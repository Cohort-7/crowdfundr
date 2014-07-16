module ApplicationHelper
  #Create and return a gavatarified url for an image tag
  def gravatarify_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  #Make time look pretty
  def pretty_time(time)
    time.strftime("%d %B %Y - %H:%M")
  end
end
