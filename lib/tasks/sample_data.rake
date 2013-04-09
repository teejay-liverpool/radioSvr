namespace :db do
	desc "Fill db"
	task populate: :environment do
		User.create!(name: "Example User",
						email: "exmaple@example.com",
						password: "xxx",
						password_confirmation: "xxx")
		99.times do |n|
			name = Faker::Name.name
			email = "example-#(n+1)@xxx.com"
			password = "xxx"
			User.create!(name: name,
						 emaul: email,
						 password: password,
						 password_confirmation: password)
			end
		end
end
