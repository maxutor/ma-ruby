class Validator
  BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }.freeze

  def initialize(str)
    @str = str
    @stack = []
  end

  def valid?
    return false if closer?(@str[0])

    @str.split('').each do |chr|
      if opener?(chr)
        @stack.push(chr)
      elsif closer?(chr)
        if closes?(@stack.last, chr)
          @stack.pop
        else
          return false
        end
      end
    end
    @stack.empty?
  end

  private

  def opener?(chr)
    BRACKETS.keys.include?(chr)
  end

  def closer?(chr)
    BRACKETS.values.include?(chr)
  end

  def closes?(opener, closer)
    BRACKETS[opener] == closer
  end
end

m = Validator.new('{(aaa)}')
puts m.valid?
