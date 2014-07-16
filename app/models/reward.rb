class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  validates :project, presence: true

  def backers_amount
  	pledges.count
  end
end
