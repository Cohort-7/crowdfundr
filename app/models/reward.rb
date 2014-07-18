class Reward < ActiveRecord::Base
	# max_paginates_per 100
	
  belongs_to :project
  has_many :pledges

  validates :project, presence: true

  def backers_amount
  	pledges.count
  end
end
