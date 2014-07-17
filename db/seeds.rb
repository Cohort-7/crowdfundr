# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
start = Time.now

USERS = 2000
PROJECTS = 200
CATEGORIES = 15
PLEDGES = 600 # + random to fund projects
FUNDED_PROJECTS = 15

USERS.times do |i|
	u = User.new
	u.email 		= Faker::Internet.free_email
	u.password	= Faker::Internet.password
	u.first_name= Faker::Name.first_name
	u.last_name	= Faker::Name.last_name
	u.save(validate: false)
	if i%200 == 0
		puts "#{i} users created"
	end
end
puts "Users done"

CATEGORIES.times do
	c = Category.new
	c.name = Faker::Commerce.department
	c.save(validate: false)
end
puts "Categories done"

PROJECTS.times do
	p = Project.new
	p.title				= Faker::Commerce.product_name
  p.description	= Faker::Lorem.paragraphs(5, false).join(' ')
  p.start_time	= Time.now - rand(0..90).days
  p.end_time		= p.start_time + 30.days
  p.goal				= (rand(5..200).to_s + '000').to_i
  p.category_id = rand(1..CATEGORIES)
  p.user_id			= rand(1..USERS)
  p.save(validate: false)
  rewards_num 	= rand(1..5)
  part_of_goal	= rand(100..200)
  rewards_num.times do |i|
  	r = Reward.new
  	r.project_id = p.id
  	r.description = Faker::Lorem.sentence(1,true,3)
  	r.cost = (p.goal / part_of_goal * (i+1)).to_i
  	r.save(validate: false)
  end
end
puts "Projects done"


PLEDGES.times do |i|
	p = Pledge.new
	p.user_id		= rand(1..USERS)
	proj = Project.find(rand(1..PROJECTS))
	proj_rew_amount = proj.rewards.count
	if proj_rew_amount > 0
		reward = proj.rewards[rand(0..(proj_rew_amount-1))]
		p.reward_id	= reward.id
		p.save(validate: false)
	end
	if i%200 == 0
		puts "#{i} pledges created"
	end
end
puts 'Pledges done'

while Project.funded.count < FUNDED_PROJECTS
	projects = Project.ended
	proj = projects[(rand(0..projects.count-1))]
	while proj.goal > proj.collected_money
		p = Pledge.new
		p.user_id		= rand(1..USERS)
		proj_rew_amount = proj.rewards.count
		if proj_rew_amount > 0
			reward = proj.rewards[rand(0..(proj_rew_amount-1))]
			p.reward_id	= reward.id
			p.save(validate: false)

		end
	end
	puts 'Project funded'
end

puts "---- TOTAL ----"
puts "#{User.all.count} users created"
puts "#{Category.all.count} categories created"
puts "#{Project.all.count} projects created"
puts "#{Reward.all.count} rewards created"
puts "#{Pledge.all.count} pledges created"
puts "#{Project.funded.count} projects funded"
puts "Done in #{(Time.now - start).to_i} seconds"
