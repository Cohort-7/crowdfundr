class Project < ActiveRecord::Base

  # max_paginates_per 100

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :rewards, inverse_of: :project
  has_many :comments, as: :commentable
  has_many :pledges, through: :rewards

  acts_as_taggable_on :tags

  has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://placehold.it/100x100"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  delegate :first_name, :last_name, :email, :full_name, to: :owner, prefix: true
  delegate :name, to: :category, prefix: true

  before_validation :set_project_dates, on: :create

  validates :title, :description, :goal, presence: true
  validates :title, length: { maximum: 40 }
  validates :goal, numericality: { only_integer: true, greater_than: 0 }
  validates_associated :rewards

  scope :funded, -> { ended.select {|p| p.goal <= p.collected_money} }
  scope :ended, -> { where('end_time < ?', Time.now) }
  scope :not_ended, -> { where('end_time > ?', Time.now) }

  def sorted_rewards
  	rewards.order(:cost)
  end

  def collected_money
  	total = self.rewards.inject(0) {|t, r| t += r.pledges.count * r.cost; t}
  end

  def was_funded?
    goal < collected_money
  end

  def has_ended?
    end_time < Time.now
  end

  def percent_funded
    (((self.collected_money.to_f)/(self.goal))*100).to_i
  end

protected

  def set_project_dates
  	self.start_time = Time.now
	  self.end_time = Time.now + 30.days
  end

end
