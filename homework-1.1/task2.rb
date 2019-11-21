require 'colorize'

color, filename = ARGV

file = File.open(filename, 'r')
puts (file.read).colorize(color.to_sym)
file.close
