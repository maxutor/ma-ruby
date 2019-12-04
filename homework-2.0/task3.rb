class ArrayFilter
  def initialize(arr)
    @arr = arr
  end

  def filter
    @arr.select do |item|
      num?(item.to_s) && (item.to_f % 2).zero?
    end
  end

  private

  def num?(num)
    num =~ /\A[-+]?[0-9]+(\.[0-9]+)?\z/
  end
end

m = ArrayFilter.new([4.0, 0, '1', '2', '1.2', '4.6', '2.2', '7', '6', '10.0', 2])
puts m.filter
