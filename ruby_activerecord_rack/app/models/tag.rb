class Tag < ActiveRecord::Base
  has_and_belongs_to_many :products
  validates :title, uniqueness: true, presence: true
end
