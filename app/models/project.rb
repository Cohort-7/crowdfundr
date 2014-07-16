class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :rewards

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
end
