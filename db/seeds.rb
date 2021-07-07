# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Faker::Config.locale = :ru

# User.create(email: 'user@user.ru', password: 'qazwsx123',
#             locality: '247',
#             first_name: 'Андрей',
#             second_name: 'Фролов',
#             third_name: 'Алексеевич')

# 10.times do
# 	user = User.new(email: Faker::Internet.email, password: 'qazwsx123',
# 	            locality: Faker::Number.number(digits: 3),
# 	            first_name: Faker::Name.male_first_name,
# 	            second_name: Faker::Name.male_middle_name,
# 	            third_name: Faker::Name.male_last_name)
#
# 		# uri = URI.parse(URI.encode('https://picsum.photos/200/300'.strip))
# 		downloaded_image = URI.parse('https://picsum.photos/200/300').open
# 		user.avatar.attach(io: downloaded_image, filename: "avatar")
#
# 	user.save!
# end
#
# statuses = [:queue, :in_work, :done, :archive]
#
#
#  ISSUES ####
#
# 10.times do
# 	issue = Issue.new(name: Faker::Quote.yoda, user_id: User.take.id, date: Time.now)
# 	issue.description = 'ТИПИЧНЫЕ ОШИБКИ В ГРАНТОВЫХ ЗАЯВКАХ ЧЕЛОВЕК. СООБЩЕСТВО. УПРАВЛЕНИЕ • No1/2004          119Относительно низкая эффективность проектной деятельности в академи-ческой среде отличает многие вузы Российской Федерации. Анализ содержания проектных заявок, подаваемых в грантодающие организации, свидетельствует об отсутствии у работников вузов навыков в области разработки проектов и общении с донорами. То же можно сказать и о большинстве авторов заявок, подаваемых от организаций других отраслей. Проектная деятельность, инно-вационная сама по себе, требует освоения новых форматов коммуникации.Проект и заявка на грант – это не одно и то же. Грантовая заявка представ-ляет  собой  финальную  часть  разработки  проекта,  словесное  описание  того, что вы собираетесь осуществить. Проекты же обычно делят на реактивные и проактивные. К первым относят проекты, которые готовятся под объявленные программы и/или конкурсы. Проактивная, т.е. предупредительная, грантовая деятельность  означает  разработку  инициативного  проекта  с  последующим поиском для его реализации средств, т.е. проектным фандрайзингом, и опыт стран с высокой донорской активностью показывает, что такая проектная де-ятельность весьма продуктивна.В настоящей статье в основном будут рассматриваться ошибки, допускае-мые  разработчиками  институциональных  (т.е.  не  индивидуальных)  проектов при подготовке грантовых заявок в реактивном режиме. Эти ошибки, хотя и в меньшей степени, свойственны и проектам, написанным в проактивном ре-жиме.Среди недостатков можно выделить два основных типа, связанных с описа-нием общих характеристик организаций и личностных характеристик испол-нителей предлагаемых проектов.'
# 	issue.status = Issue.statuses.sample
#
# 	5.times do |t|
# 		downloaded_image = URI.parse('https://picsum.photos/200/300').open
# 		issue.images.attach(io: downloaded_image, filename: "issu-#{t}")
# 	end
#
# 	issue.save!
# end


# INVITES

# 10.times do |t|
# 	User.invite!(email: Faker::Internet.email, first_name: Faker::Name.unique.name, roles: Role.where(name: 'common') )
# end


# ROLES

['super_admin', 'admin', 'common', 'interested'].each do |role|
	Role.find_or_create_by({ name: role })
end

CATEGORIES = ['accident']
CATEGORIES.each { |category| Category.find_or_create_by!({ name: category }) }

# 10.times do
# 	project = Project.new(title: Faker::Book.title,
# 	                      description: Faker::Lorem.sentence,
# 	                      goal_price: 100000)
# 	3.times do |t|
# 		downloaded_image = URI.parse('https://picsum.photos/200/300').open
# 		project.images.attach(io: downloaded_image, filename: "#{file}-#{t}")
# 	end
# 	project.save!
# end
