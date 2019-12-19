class Product < ActiveRecord::Base
  belongs_to :shop
  belongs_to :category

  has_and_belongs_to_many :tags

  has_many :feedbacks
  has_many :questions

  before_validation :capitalize_productname

  validates :price, :title, presence: true

  private

  def capitalize_productname
    self.title = title.capitalize
  end
end
