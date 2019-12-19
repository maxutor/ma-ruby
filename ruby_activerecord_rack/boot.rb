require './config/initializers/database'
Dir['./app/models/*.rb'].each { |f| require f.gsub('.rb', '') }
#
#shop = Shop.new(
#  domain: 'rozetka.com.ua',
#  name: 'Rozetka',
#  address: 'Lviv',
#  is_open: true,
#  staff_count: 500
#)
#shop.save
#
#category1 = Category.create(title: 'boots', shop: shop)
#category1.save
#category2 = Category.create(title: 'jackets', shop: shop)
#category2.save
#
#tag1 = Tag.create(title: 'winter')
#product1 = Product.create(title: 'winter jacket1', price: '3500', shop: shop, category: category2)
#
#first_question = Question.new(
#  comment: "47th size is available?",
#  username: 'Maksym',
#  product: product1
#)
#first_question.save
#
#first_feedback = Feedback.new(rate: 4, comment: 'very warm jacket', product: product1)
#first_feedback.save
#
#product2 = Product.create(title: 'winter jacket2', price: '1500', shop: shop, category: category2)
#product3 = Product.create(title: 'winter jacket3', price: '7500', shop: shop, category: category2)
#product4 = Product.create(title: 'winter jacket4', price: '1030', shop: shop, category: category2)
#
#product1.tags << tag1
#product2.tags << tag1
#product3.tags << tag1
#product4.tags << tag1
#
#first_question = Question.new(
#  comment: "It`s original?`",
#  product: product3
#)
#first_question.save
#
#second_question = Question.new(
#  comment: "Why so cheap???",
#  product: product2
#)
#second_question.save

def sort_tags_products_by_price(tag_name)
  tag = Tag.find_by(title: tag_name)
  tag.products.order(:price).each { | p | puts "#{p.title} price is: #{p.price}" }
end

def products_in_shop_with_category(category_name, shop_name)
  products = Product.joins(category: :shop).where(shops: { name: shop_name })
  products.each { | p | puts "#{shop_name} has a category - #{category_name}: #{p.title}" }
end

def all_products_in_shop(shop_name)
  shop = Shop.where(name:shop_name)
  products = Product.where(shop: shop)
  products.each { | p | puts "#{shop_name} has: #{p.title}" }
end

def all_feedbacks
  feedbacks = Feedback.all
  feedbacks.each { | f | puts "#{f.username} posted a review with rate:#{f.rate} on #{f.product.title}" }
end

def all_opened_question
  questions = Question.where(is_open: true)
  questions.each do |q|
    puts "#{q.username} about #{q.product.title}: #{q.comment}"
  end
end

def answer_the_question(question_id, answer)
  question = Question.find(question_id)
  question.update(admin_answer: answer)
end

sort_tags_products_by_price('winter')
p '//'
products_in_shop_with_category('jackets', 'Rozetka')
p '//'
all_products_in_shop('Rozetka')
p '//'
all_feedbacks
p '//'
all_opened_question
p '//'
answer_the_question(2, 'Of course')
p '//'
all_opened_question

