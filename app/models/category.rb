class Category < ActiveRecord::Base
	# max_paginates_per 100
  has_many :projects

	def total_money
		self.projects.inject(0) {|t, p| t += p.collected_money; t }
	end

end
