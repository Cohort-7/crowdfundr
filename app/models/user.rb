class User < ActiveRecord::Base
  has_many :pledges
  has_many :projects

  has_secure_password
end
