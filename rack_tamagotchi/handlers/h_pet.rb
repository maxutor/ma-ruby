module Handlers
  require_relative 'base'

  class Pet < Base

    def initialize(request)
      @request = request
    end

    def response
      if @request.path_info.match /\A#{'/api/pets/'}\d+/
        pet_id = @request.path_info.split('/')[3]
        pet = ::Pet.find_by(id: pet_id)
        return respond_404 unless pet

        return respond_400(pet.name) unless pet.is_alive
        actions(pet)

        html_body = Views.one_pet(pet)

        respond_200(html_body)
      elsif @request.get? && @request.path_info.start_with?(/\A#{'/api/pets'}\z/)
        pets = ::Pet.all.order(:id)
        html_body = Views.all_pets(pets)

        respond_200(html_body)
      elsif @request.post? && @request.path_info.start_with?(/\A#{'/api/pets'}\z/)

        pet_params = JSON.parse(@request.body.read)
        pet = ::Pet.create(pet_params.slice('name'))

        Rack::Response.new(pet.to_json, 200, JSON_HEADERS).finish
      else
        respond_404
      end
    end

    private

    def actions(pet)
      if @request.put? && @request.path_info.start_with?(/\A#{'/api/pets/'}\d+#{'/walk'}\z/)
        pet.update(hunger: pet.hunger - 20, health: pet.health - 5, mood: 'very happy')
      elsif @request.put? && @request.path_info.start_with?(/\A#{'/api/pets/'}\d+#{'/hit_pet'}\z/)
        pet.update(health: pet.health - 30, mood: 'sad')
      elsif @request.put? && @request.path_info.start_with?(/\A#{'/api/pets/'}\d+#{'/feed'}\z/)
        pet.update(hunger: pet.hunger + 40, health: pet.health + 40, mood: 'fat happy pet')
      elsif @request.put? && @request.path_info.start_with?(/\A#{'/api/pets/'}\d+#{'/to_pet'}\z/)
        pet.update(hunger: pet.hunger - 10, health: pet.health + 5, mood: 'happy')
      elsif @request.put? && @request.path_info.start_with?(/\A#{'/api/pets/'}\d+#{'/give_toy'}\z/)
        pet.update(hunger: pet.hunger - 15, health: pet.health + 15, mood: 'busy')
      end
    end
  end
end
