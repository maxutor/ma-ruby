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
    return true if @stack.empty?

    false
  end

  private

  def opener?(chr)
    BRACKETS.keys.include?(chr)
  end

  def closer?(chr)
    BRACKETS.values.include?(chr)
  end

  def closes?(opener, closer)
    return false unless BRACKETS[opener] == closer

    true
  end
end

m = Validator.new('{(aaa)}')
puts m.valid?
