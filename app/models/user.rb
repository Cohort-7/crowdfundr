class User < ActiveRecord::Base
  # max_paginates_per 100
  
  has_many :pledges
  has_many :projects

  has_secure_password
  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6}, on: :create

  def full_name
  	"#{first_name} #{last_name}"
  end

end
