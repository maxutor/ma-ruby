class Category < ActiveRecord::Base
  has_many :products
  validates :title, uniqueness: true, presence: true
end
