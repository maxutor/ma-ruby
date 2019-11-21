require 'colorize'

color = ARGV[0]

filename = ARGV[1]

file = File.open(filename, 'r')
puts (file.read).colorize(color.to_sym)
file.close
