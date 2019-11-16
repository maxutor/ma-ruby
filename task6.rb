class NotANumberError < StandardError
  def initialize(obj)
    super("#{obj} not a number")
  end
end

class PseudoInt

  attr_reader :num
  def initialize(num)
    if num.is_a?(Numeric)
      @num = num
    else
      raise NotANumberError.new(num)
    end
  end

  def +(other_pint)
    num + other_pint.num
  end

  def -(other_pint)
    num - other_pint.num
  end

  def /(other_pint)
    num.to_f / (other_pint.num).to_f
  end

  def *(other_pint)
    num * other_pint.num
  end
end

pint1 = PseudoInt.new(ARGV[0].to_i)
pint2 = PseudoInt.new(ARGV[1].to_i)
p pint1 + pint2
p pint1 - pint2
p pint1 / pint2
p pint1 * pint2
