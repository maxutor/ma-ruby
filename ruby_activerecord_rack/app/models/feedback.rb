class Feedback < ActiveRecord::Base
  belongs_to :product

  validates :rate, inclusion: 1..5, presence: true
  validates :comment, length: { maximum: 256 }, presence: true
  validates :username, length: { in: 3..56 }, presence: true
end
