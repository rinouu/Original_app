# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["Career follow-up", "relational","punctuality","Resource management", "supplier faults"]
categories.each do |category|
	Category.create!( 
	    name: category,
	)
end

10.times do |index|
	User.create!( 
	    name: Faker::Name.name,
	    email: Faker::Internet.email,
	    password: "password", 
	    password_confirmation: "password",
	)
end
User.create!( 
    name: "admin",
    email: "admin@dive.l",
    password: "password", 
    password_confirmation: "password",
    admin: true,
)


10.times do |index|
	Punctuality.create!(
		date: DateTime.now.to_date,
		arrival_time: Time.now,
		departure_time: Time.now,
		user_id: User.all.pluck(:id).sample,
	)
end

10.times do |index|
	Plaint.create!( 
		title: Faker::Lorem.words,
	    description: Faker::Lorem.sentence,
	    remarks:  Faker::Lorem.sentence,
	    user_id: User.all.pluck(:id).sample,
	)
end

10.times do |index|
	PlaintCategory.create!( 
	    plaint_id: Plaint.all.pluck(:id).sample,
	    category_id: Category.all.pluck(:id).sample,
	)
end
