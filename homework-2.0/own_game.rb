require_relative 'both_games_methods.rb'

class OwnGame
  include NewMethods
  def initialize(level_background, count_of_enemies, speed_enemies,
                 type_of_enemies, level_number, type_of_level)
    @background = level_background
    @enemies = count_of_enemies
    @speed_enemies = speed_enemies
    @type_of_enemies = type_of_enemies
    @level_number = level_number
    @type_of_level = type_of_level
  end

  def change_level(new_level_number)
    @level_number = new_level_number
  end

  def change_type_of_level(new_level_type)
    @type_of_level = new_level_type
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

  def change_type_of_enemies(new_enemies_type)
    @type_of_enemies = new_enemies_type
  end

  def show_type_of_level
    "Type of current level is: #{@type_of_level}"
  end

  def show_type_of_enemies
    "Type of enemies is: #{@type_of_enemies}"
  end
end

m = OwnGame.new('desert', 130, 5, 'melee', 10, 'bonus level')
p m.show_background
p m.show_count_of_enemies
p m.show_speed_of_enemies
p m.show_type_of_enemies
p m.show_level
p m.show_type_of_level
