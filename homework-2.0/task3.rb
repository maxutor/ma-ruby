class ArrayFilter
  def initialize(arr)
    @arr = arr
  end

  def filter
    @arr.select { |item| (to_numeric(item) % 2).zero? }
  end

  private

  def to_numeric(thing)
    return thing.to_s.to_i if thing.to_s == thing.to_s.to_i.to_s
    return thing.to_s.to_f if thing.to_s == thing.to_s.to_f.to_s
  end
end

m = ArrayFilter.new([4.0, 0, '1', '2', '1.2', '4.6', '2.2', '7', '6', '10.0', 2])
puts m.filter
