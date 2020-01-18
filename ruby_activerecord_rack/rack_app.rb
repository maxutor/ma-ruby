require 'json'
require './config/initializers/database'
Dir['./app/models/*.rb'].each { |f| require f.gsub('.rb', '') }
Dir['./handlers/*.rb'].each { |f| require f.gsub('.rb', '') }


class RackApp
  def call(env)
    request = Rack::Request.new(env)

    if request.path.start_with? /\A#{'/api/shops/'}\d+#{'/tags'}/
      Handlers::Tag.new(request).response
    elsif request.path.start_with? /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/questions'}/
      Handlers::Question.new(request).response
    elsif request.path.start_with? /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products/'}\d+#{'/feedbacks'}/
      Handlers::Feedback.new(request).response
    elsif request.path.start_with? /\A#{'/api/shops/'}\d+#{'/categories/'}\d+#{'/products'}/
      Handlers::Product.new(request).response
    elsif request.path.start_with? /\A#{'/api/shops/'}\d+#{'/categories'}/
      Handlers::Category.new(request).response
    elsif request.path.start_with? /\A#{'/api/shops'}/
      Handlers::Shop.new(request).response
    else
      Rack::Response.new({error: 'Not found'}.to_json, 404, {'Content-Type' => 'application/json'}).finish
    end
  end
end
