require_relative 'both_games_methods.rb'

class MarioGame
  include NewMethods
  attr_accessor :level_background, :count_of_enemies, :speed_enemies, :level_number
  @@instances = []

  def initialize(level_background, count_of_enemies, speed_enemies, level_number)
    @background = level_background
    @enemies = count_of_enemies
    @speed_enemies = speed_enemies
    @level_number = level_number
    @@instances << self

    # Define splash screen for current instance
    singleton_class.define_method(:splash_screen) { p 'Splash screen here' }
    # Remove splash screen from prev instance
    @@instances[-2].singleton_class.remove_method :splash_screen if @@instances.count > 1
  end

  def change_level(new_level_number)
    @level_number = new_level_number
  end

  def change_background(new_background_color)
    @background = new_background_color
  end

  def change_speed_enemies(new_speed_enemies)
    @speed_enemies = new_speed_enemies
  end

  def change_counf_of_enemies(new_count_of_enemies)
    @enemies = new_count_of_enemies
  end
end

m = MarioGame.new('forest1', 10, 115, 1)
b = MarioGame.new('forest2', 11, 116, 2)
c = MarioGame.new('forest3', 12, 117, 3)
a = MarioGame.new('forest4', 13, 118, 4)
mf = MarioGame.new('forest5', 14, 119, 5)
mw = MarioGame.new('forest6', 15, 120, 6)
mq = MarioGame.new('forest7', 16, 121, 7)

mq.splash_screen
m = MarioGame.new('forest1', 10, 115, 1)
m.splash_screen
mq.splash_screen
