require './rack_app'

use Rack::Reloader, 0

run RackApp.new
