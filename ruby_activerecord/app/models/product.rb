class Product < ActiveRecord::Base
  belongs_to :shop
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :feedbacks
  has_many :questions
  validates :price, :title, presence: true
  before_validation :capitalize_productname

  private
  def capitalize_productname
    self.title = self.title.capitalize
  end
end
