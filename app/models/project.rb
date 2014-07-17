class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :rewards, inverse_of: :project

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  delegate :first_name, :last_name, :email, to: :owner, prefix: true

  # assign user with id 1 to project --- REMOVE WHEN INTEGRATED WITH USER
  before_validation lambda {self.user_id = 1}, on: :create # !!!!!!!!!!!!

  before_validation :set_project_dates, on: :create

  validates :title, :description, :goal, presence: true
  validates :title, length: { maximum: 40 }
  validates :goal, numericality: { only_integer: true, greater_than: 0 }
  validates_associated :rewards

  scope :funded, -> { ended.select {|p| p.goal <= p.collected_money} }
  scope :ended, -> { where('end_time < ?', Time.now) }

  def sorted_rewards
  	rewards.order(:cost)
  end

  def collected_money
  	total = self.rewards.inject(0) {|t, r| t += r.pledges.count * r.cost; t}
  end

  def time_left
  	t = end_time - Time.now
    if t <= 0
      return "funding ended"
  	elsif t < 3600
  		return "less then 1 hour"
  	elsif t < 86400
  		m = (t / 60 % 60).round
  		h = (t / 60 / 60).round
  		return "#{h} hours #{m} minutes"
  	elsif t < 172800
  		m = (t / 60 % 60).round
  		h = (t / 60 / 60 % 24).round - 1
  		return "1 day #{h} hours #{m} minutes"
  	else
  		t = (t / 86400).round
  		return "#{t} days"
  	end
  end

  def has_ended?
    end_time < Time.now
  end

protected

  def set_project_dates
  	self.start_time = Time.now
	  self.end_time = Time.now + 2.days
  end

end
