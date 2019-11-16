class PseudoInt
  attr_reader :num

  def initialize(num)
    @num = num
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

def is_i?(num)
  num =~ /\A[-+]?[0-9]+\z/
end

if is_i?(ARGV[0])
  pint1 = PseudoInt.new(ARGV[0].to_i)
else
  puts "Error: #{ARGV[0]} is not a number"
  return
end

if is_i?(ARGV[1])
  pint2 = PseudoInt.new(ARGV[1].to_i)
else
  puts "Error: #{ARGV[1]} is not a number"
  return
end

p pint1 + pint2
p pint1 - pint2
p pint1 / pint2
p pint1 * pint2
