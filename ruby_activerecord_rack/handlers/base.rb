module Handlers
  require 'json'

  class Base
    HEADERS = {'Content-Type' => 'application/json'}.freeze

    def respond_404
      Rack::Response.new({error: 'Not found'}.to_json, 404, HEADERS).finish
    end

    def respond_200(body)
      Rack::Response.new(body.to_json, 200, HEADERS).finish
    end
  end
end
