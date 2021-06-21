# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(email: 'user@user.ru', password: 'qazwsx123',
#             locality: '247',
#             first_name: 'Андрей',
#             second_name: 'Фролов',
#             third_name: 'Алексеевич')

10.times do
	project = Project.new(title: Faker::Book.title,
	                      description: Faker::Lorem.sentence,
	                      goal_price: 100000)
	3.times do |t|
		downloaded_image = URI.parse('https://picsum.photos/200/300').open
		project.images.attach(io: downloaded_image, filename: "#{file}-#{t}")
	end
	project.save!
end
