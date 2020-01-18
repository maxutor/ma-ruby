class AddShopToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :shop, index: true
  end
end
