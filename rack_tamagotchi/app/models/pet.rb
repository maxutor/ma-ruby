class Pet < ActiveRecord::Base
  validates :name, length: { in: 3..56 }, presence: true
  validates :hunger, inclusion: -50..100
  validates :health, inclusion: -50..100

  before_save :pet_is_alive
  before_validation :normalize_characteristics

  def pet_is_alive
    if self.hunger < 1 || self.health < 1
      self.is_alive = false
    end
  end

  def normalize_characteristics
    if self.hunger > 100
      self.hunger = 100
    end

    if self.health > 100
      self.health = 100
    end
  end
end
