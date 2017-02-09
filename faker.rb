5.times do 
	client = Client.new
	client.name = Faker::Name.name
	client.email = Faker::Internet.email
	client.mobile = Faker::Number.number(10)
	client.company = Faker::Company.name
	client.website = "www.#{Faker::Internet.domain_name}"
	client.save
end

5.times do
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.start_date = Faker::Date.between(Date.today.beginning_of_year,Date.today)
	project.client_id = Client.all.sample.id
	project.status = ["new","on-going","completed"].sample
    project.save
end	

1000.times do
	product = Product.new
	product.name = Faker::Name.first_name
	product.price = Faker::Commerce.price
	product.category = Faker::Commerce.department(10)
	product.brand = Faker::Lorem.words(10)
	product.size = ["Small","Large","Medium","very_small"].sample
	product.discount = ["10%","50%","30%","70%"].sample
	product.color = Faker::Commerce.color
	product.availability = Faker::Boolean.boolean
	product.save
end
#Client.all.sample.id


5.times do
	article = Article.new
	article.user_id = Category.all.sample.id 
	article.save
end