# Class uses a system('clear') method!!!
class Game
  def initialize
    @splash = Array.new(5) { Array.new(100, ' ') }
    @human_pos = 1
  end

  def start_the_game
    define_default
    draw
    while input = gets
      move_human
      end_of_game if human_reached?
      draw
    end
  end

  private

  def define_default
    draw_floor
    draw_pyramid
    draw_human
  end

  def draw_floor
    @splash << ['#'] * 100
  end

  def draw_pyramid
    (0..4).to_a.each do |i|
      j = 80 - i * 2
      width = (i + 1) * 4
      @splash[i][j, width] = ['#'] * width
    end
  end

  def draw_human
    @splash[2][@human_pos, 2] = ['#'] * 2
    @splash[3][@human_pos - 1, 4] = ['#'] * 4
    @splash[4][@human_pos, 2] = ['#'] * 2
  end

  def draw_flag
    3.times { @splash.prepend([' '] * 100) }
    @splash[0][79, 4] = ['#'] * 4
    @splash[1][79, 4] = ['#'] * 4
    @splash[2][82] = ['#']
  end

  def move_human
    @human_pos += 2
    draw_human
    clear_after_human
  end

  def clear_after_human
    @splash[2][@human_pos - 2, 2] = [' '] * 2
    @splash[3][@human_pos - 3, 2] = [' '] * 2
    @splash[4][@human_pos - 2, 2] = [' '] * 2
  end

  def human_reached?
    @human_pos >= 80 - 14
  end

  def draw
    system('clear')
    @splash.each do |arr|
      puts arr.join
    end
  end

  def end_of_game
    draw_flag
    draw
    puts 'THE END'
    exit
  end
end

f = Game.new
f.start_the_game
