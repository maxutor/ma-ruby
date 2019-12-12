class Shop < ActiveRecord::Base
  has_many :categories
  has_many :products

  validates :domain, uniqueness: true, presence: true
end
