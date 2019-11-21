require_relative 'operator_colors_task6.rb'

class ColorInt
  include OperatorColors
  attr_reader :num

  def initialize(num)
    @num = num.to_i
  end

  %i[+ - * /].each do |operator|
    define_method(operator) do |obj|
      result = @num.send(operator, obj.num)

      color_code = OPERATOR_COLOR_CODES[operator]
      "\e[#{color_code}m#{result}\e[0m"
    end
  end
end

a = ColorInt.new(10)
b = ColorInt.new(15)
puts a + b
puts a - b
puts a * b
puts a / b
