namespace :db do
	desc "Fill db"
	task populate: :environment do
		User.create!(name: "tim",
						email: "tim",
						password: "tim",
						password_confirmation: "tim")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@xxx.com"
			password = "xxx"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)

		end


		users = User.all( limit:6)
		50.times do
			content = Faker::Lorem.sentence(1)
			users.each{ |user| user.microposts.create!( content: content ) }
		end

	end

end
