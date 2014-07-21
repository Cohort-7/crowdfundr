module UsersHelper
  #Create and return a gavatarified url for an image tag
  def gravatarify_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?s=200"
  end

  def owner?(user)
    current_user && current_user.id == user.id
  end
end
