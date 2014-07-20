class User < ActiveRecord::Base
  # max_paginates_per 100
  
  has_many :pledges
  has_many :projects
  has_many :comments, class_name: 'Comment', as: :commentable # comments on user profile
  has_many :own_comments, class_name: 'Comment' # user own comments

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

  def self.with_projects
    where("id in (?)", ids_with_projects.map{|u| u.id})
  end

  def self.ids_with_projects
    User.find_by_sql("select distinct(u.id) from users u, projects p where p.user_id = u.id;")
  end

end
