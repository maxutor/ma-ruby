require 'json'
require './config/initializers/database'
Dir['./app/models/*.rb'].each { |f| require f.gsub('.rb', '') }
Dir['./handlers/*.rb'].each { |f| require f.gsub('.rb', '') }


class RackApp
  def call(env)
    request = Rack::Request.new(env)

    if request.path.start_with? /\A#{'/api/pets'}/
      Handlers::Pet.new(request).response
    else
      Rack::Response.new({error: 'Not found'}.to_json, 404, {'Content-Type' => 'application/json'}).finish
    end
  end
end
