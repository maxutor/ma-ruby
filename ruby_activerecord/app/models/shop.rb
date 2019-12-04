class Shop < ActiveRecord::Base
  has_many :products
  validates :domain, uniqueness: true
end
