class Category < ActiveRecord::Base
	# max_paginates_per 100
  has_many :projects
end
