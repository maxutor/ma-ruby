class PseudoInt
  attr_reader :num

  def initialize(num)
    @num = num.to_i
  end

  %i[+ - * /].each do |operator|
    define_method(operator) do |obj|
      @num.send(operator, obj.num)
    end
  end
end

a = PseudoInt.new(10)
b = PseudoInt.new(15)
p a + b
p a - b
p a * b
p a / b
