class User < ActiveRecord::Base
  has_many :pledges
  has_many :projects
end
