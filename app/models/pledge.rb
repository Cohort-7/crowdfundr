class Pledge < ActiveRecord::Base
	# max_paginates_per 100
  belongs_to :user
  belongs_to :reward

  delegate :project, :to => :reward, allow_nil: true
end
