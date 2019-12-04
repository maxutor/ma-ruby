module NewMethods
  def show_level
    "Current level is: #{@level_number}"
  end

  def show_background
    "Current background is: #{@background}"
  end

  def show_speed_of_enemies
    "Current speed of enemies on level is: #{@speed_enemies}"
  end

  def show_count_of_enemies
    "Count of enemies on level is: #{@enemies}"
  end
end
