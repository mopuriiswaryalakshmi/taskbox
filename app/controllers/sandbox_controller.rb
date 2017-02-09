class SandboxController < ApplicationController

	def clients
     @clients = Client.all
	end

  def projects
  	@projects = Project.where('start_date > ? AND start_date < ?', Date.today.beginning_of_month-3.months,Date.today.beginning_of_month).order('start_date')
  end

  def products
=begin

    1. List all products based on a given category
    2. List products based on price range
    3. List products based on brand
    4. List products based on size of a certain brand falling within a given price range
    5. List products that are available
    6. List products following under price 499
    7. List products upto price 1200
    8. List all products based on the categories
    9. List only products which are available
    10. List products price descending and name ascending
    11. List products whose prices are the same as a group
    12. Display the total worth of the products
    13. Display total worth of products in each category
    14. List all products based on the categories


=end
	# 1
	@category = "Toys"
	@products_category = Product.where('category = ?', @category).limit(20)

	#2
	@price_range_min = 300
	@price_range_max = 500
	@products_price_range = Product.where('price >= ? AND price <= ?', @price_range_min, @price_range_max).limit(20)

	#3
	@brand = "Peter England"
	@products_brand = Product.where('brand = ?', @brand).limit(20)

	#4
	@size = "XL"
	@products_size = Product.where('size = ? AND brand = ? AND price >= ? AND price <= ?', @size, @brand, @price_range_min, @price_range_max).limit(20)

	#5
	@products_available = Product.where('availability = ? ', "t").limit(20)

	#6
	@price = 499
	@products_price = Product.where('price <= ?', @price).limit(20)

	#7
	@price = 999 
	@products_price_upto = Product.where('price <= ?', @price).limit(20)

	#8
	@category_product_hash = {}
	@products = Product.all.limit(20)
	@products.each do |product|
		if @category_product_hash.has_key? product.category 
			@category_product_hash[product.category].push(product.name)
		else
			#@category_product_hash[product.category] = []
			@category_product_hash[product.category] = [product.name]
		end
	end

	#9
	#same as 5th query

	#10
	@products 
	@price_name_order = @products.order('price DESC', 'name')


	#11
	@products = Product.all
	@price_group_hash = {}
	@products.each do |product|
		if @price_group_hash.has_key? product.price
			@price_group_hash[product.price].push(product.name)
			binding.pry
		else
			@price_group_hash[product.price] = [product.name]
			binding.pry
		end
	end
=begin
	@price_group_hash["0 - 25"] = @products.where('price >= ? AND price <= ?', 0, 25).limit(10)
	@price_group_hash["26 - 50"] = @products.where('price >= ? AND price <= ?', 26, 50).limit(10)
	@price_group_hash["51 - 75"] = @products.where('price >= ? AND price <= ?', 51, 75).limit(10)
	@price_group_hash["76 - 99"] = @products.where('price >= ? AND price <= ?', 76, 99).limit(10)
=end


	#12
	@total_worth = Product.sum(:price)
=begin
	@total_worth = 0
	@products = Product.all
	@products.each do |product|
		@total_worth += product.price
	end
=end
	#13
	@category_price_hash = {}
	@products = Product.all.limit(20)
	@products.each do |product|
		if @category_price_hash.has_key? product.category 
			@category_price_hash[product.category] += product.price
		else
			#@category_product_hash[product.category] = 0
			@category_price_hash[product.category] = product.price
		end
	end

	#14
	#same as query 8

	#15
	@category_hash = {}
	@products = Product.all
	@products.each do |product|
		if @category_hash.has_key? product.category 
			@category_hash[product.category]["names"].push(product.name)
			@category_hash[product.category]["total_worth"] += product.price
		else
			@category_hash[product.category] = {}
			@category_hash[product.category]["names"] = [product.name]
			@category_hash[product.category]["total_worth"] = product.price
		end
	end
end
end



#from here
def projects
    @projects = Project.where('start_date > ? AND start_date < ?', Date.today.beginning_of_month-3.months,Date.today.beginning_of_month).order('start_date')
     #Date.today.end_of_month
     #Date.tomorrow
  end

=begin
  
rescue Exception => e
  
end
  def products
  	#@products = Product.all
  	#@products_Kids = Product.where('category = ?',"Kids")
  	#@products_price = Product.order('price DESC')
  	#@products_category_price = Product.where('price<= ? OR category = ?', "50","Kids")
  	#@products_brand = Product.where('brand = ?','["necessitatibus", "quos", "dolor", "voluptatem", "placeat", "fugiat", "dicta", "quasi", "enim", "vel"]')
  	#@products_range= Product.where('size = ? OR brand = ? OR price <= ?','Medium','["optio", "labore", "nesciunt", "quaerat", "voluptatum", "consequuntur", "minus", "aut", "rerum", "provident"]','60')
  	#@products_available = Product.where('availability = ?','t')
  	#@products_range499 = Product.where('price == ?',"99")
  	#@products_range1200 = Product.where('price <= ?',"99")
  	#@products_Kids = Product.where('category = ?',"Kids")
  	#@products_available = Product.where('availability = ?','t')
  	#@products_order = Product.order('price DESC','name')

=begin

    1. List all products based on a given category
    2. List products based on price range
    3. List products based on brand
    4. List products based on size of a certain brand falling within a given price range
    5. List products that are available
    6. List products following under price 499
    7. List products upto price 1200
    8. List all products based on the categories
    9. List only products which are available
    10. List products price descending and name ascending
    11. List products whose prices are the same as a group
    12. Display the total worth of the products
    13. Display total worth of products in each category
    14. List all products based on the categories


=end


  # 1. List all products based on a given category
  @category = "Toys"
  @products_category = Product.where('category = ?', @category).limit(20)
  #@products_by_category = Product.where('category = ?',"Music")
  #products_category = Product.where('category = ?', "Kids").limit(20)  # for cmd

  #2
  @price_range_min = 30
  @price_range_max = 50
  @products_price_range = Product.where('price >= ? AND price <= ?', @price_range_min, @price_range_max).limit(20)
  #@products_by_price = Product.where('price > ? AND price < ?',0,25)
  products_price_range = Product.where('price >= ? AND price <= ?', 30, 50).limit(20) #for cmd

  #3
  #@brand = '["ut", "sunt", "dolores", "nam", "officiis", "sunt", "autem", "dignissimos", "molestiae", "cupiditate"]'
  #@products_brand = Product.where('brand = ?', @brand).limit(20)
  #@products_by_brand = Product.where('brand = ?',"["veritatis", "non", "et", "et", "esse", "distinctio", "amet", "numquam", "quisquam", "natus"]")
  #@products_brand = Product.where('brand = ?',["veritatis", "non", "et", "et", "esse", "distinctio", "amet", "numquam", "quisquam", "natus"]
 # ).limit(20)


  #4
  @size = "Medium"
  @products_size = Product.where('size = ? AND brand = ? AND price >= ? AND price <= ?', @size, @brand, @price_range_min, @price_range_max).limit(20)
  #@product_by_price_brand_size = Product.where('price > ? AND price < ? AND size = ? AND brand = ?',10,200,,15,"["veritatis", "non", "et", "et", "esse", "distinctio", "amet", "numquam", "quisquam", "natus"]")

  #5
  @products_available = Product.where('availability = ? ', "t").limit(20)
  #@products_by_availability = Product.where('availability = ?',"t")

  #6
  @price = 49
  @products_price = Product.where('price <= ?', @price).limit(20)
  #@products_under_price = Product.where('price < ?',499)

  #7
  @price = 99 
  @products_price_upto = Product.where('price <= ?', @price).limit(20)
  #@products_upto_price = Product.where('price < ?',1200)

  #8
  @category_product_hash = {}
  @products = Product.all.limit(20)
  @products.each do |product|
    if @category_product_hash.has_key? "product.category"

      @category_product_hash[product.category].push(product.name)
      binding.pry
    else
      #@category_product_hash[product.category] = []
      @category_product_hash[product.category] = [product.name]
      binding.pry
    end
  end

  #9
  #same as 5th query

  #10
  @products 
  @price_name_order = @products.order('price DESC').order('name')
  #@price_name_order = @products.order('price DESC', 'name')



  #11
  @products = Product.all
  @price_group_hash = {}
  @products.each do |product|
    if @price_group_hash.has_key? product.price
      @price_group_hash[product.price].push(product.name)
    else
      @price_group_hash[product.price] = [product.name]
    end
  end
=end