class Pledge < ActiveRecord::Base
  belongs_to :user
  has_one :reward

  delegate :project, :to => :reward, allow_nil: true
end
