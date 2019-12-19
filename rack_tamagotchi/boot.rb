require './config/initializers/database'
Dir['./app/models/*.rb'].each { |f| require f.gsub('.rb', '') }

pet = Pet.find(1)
pet.update(hunger: 100, health: 100, is_alive: true)
