class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward

  delegate :project, :to => :reward, allow_nil: true

  validates :user, presence: true
  validates :reward, presence: true

end
