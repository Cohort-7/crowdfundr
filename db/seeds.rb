# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

300.times do
	u = User.new
	u.email 		= Faker::Internet.free_email
	u.password	= Faker::Internet.password
	u.first_name= Faker::Name.first_name
	u.last_name	= Faker::Name.last_name
	u.save
end
puts "#{User.all.count} users created"

15.times do
	c = Category.new
	c.name = Faker::Commerce.department
	c.save
end
puts "#{Category.all.count} categories created"

50.times do
	p = Project.new
	p.title				= Faker::Commerce.product_name
  p.description	= Faker::Lorem.paragraphs(5, false).join(' ')
  p.start_time	= Time.now - rand(0..10).days
  p.end_time		= p.start_time + 5.days
  p.goal				= (rand(5..200).to_s + '000').to_i
  p.category_id = rand(1..15)
  p.user_id			= rand(1..300)
  p.save
  rewards_num 	= rand(1..5)
  part_of_goal	= rand(100..200)
  rewards_num.times do |i|
  	r = Reward.new
  	r.project_id = p.id
  	r.cost = (p.goal / part_of_goal * (i+1)).to_i
  	r.save
  end
end
puts "#{Project.all.count} projects created"
puts "#{Reward.all.count} rewards created"

500.times do
	@p = Pledge.new
	@p.user_id		= rand(1..300)
	@proj = Project.find(rand(1..50))
	proj_rew_amount = @proj.rewards.count
	if proj_rew_amount > 0
		@reward = @proj.rewards[rand(0..(proj_rew_amount-1))]
		@p.reward_id	= @reward.id
		@p.save
	end
end
puts "#{Pledge.all.count} pledges created"

