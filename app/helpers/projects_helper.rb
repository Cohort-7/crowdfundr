module ProjectsHelper
	def time_left_or_passed(end_time)
  	t = end_time - Time.now
    if t <= 0
      return "Finished #{time_ago_in_words(end_time)} ago"
  	elsif t < 3600
  		return "Less then 1 hour left"
  	elsif t < 86400
  		m = (t / 60 % 60).round
  		h = (t / 60 / 60).round
  		return "#{h} hours #{m} minutes left"
  	elsif t < 172800
  		m = (t / 60 % 60).round
  		h = (t / 60 / 60 % 24).round - 1
  		return "1 day #{h} hours #{m} minutes left"
  	else
  		t = (t / 86400).round
  		return "#{t} days left"
  	end
  end
end
