class Colorant
  COLOR_CODES = {
    black: 30, red: 31, green: 32, brown: 33, blue: 34, magenta: 35, cyan: 36, gray: 37
  }.freeze

  def initialize(text)
    @text = text
  end

  COLOR_CODES.keys.each do |color|
    define_method(color) do
      color_code = COLOR_CODES[color]
      puts "\e[#{color_code}m#{@text}\e[0m"
    end
  end
end

text = gets.chomp
color = gets.chomp

Colorant.new(text).send(color)
