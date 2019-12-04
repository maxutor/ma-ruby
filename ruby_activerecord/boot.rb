require './config/initializers/database'
require './app/models/shop'
require './app/models/product'

shop = Shop.find(1)

shop.products.create(title: 'phone', price: 100)
puts shop.products.count
