module Handlers
  require 'json'
  require "erb"
  require './app/assets/views'

  class Base
    include Views

    HTML_HEADERS = {'Content-Type' => 'text/html'}.freeze
    JSON_HEADERS = {'Content-Type' => 'application/json'}

    def respond_404
      Rack::Response.new({error: 'Not found'}.to_json, 404, JSON_HEADERS).finish
    end

    def respond_200(body, status = 200)
      Rack::Response.new(body, status, HTML_HEADERS).finish
    end

    def respond_400(name)
      html_body = Views.dead_pet(name)
      Rack::Response.new(html_body, 400, HTML_HEADERS).finish
    end
  end
end
