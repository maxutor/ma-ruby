class Category < ActiveRecord::Base
  belongs_to :shop
  has_many :products

  validates :title, uniqueness: true, presence: true
end
