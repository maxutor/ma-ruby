class CreateProducts < ActiveRecord::Migration[5.1]
  def up
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.belongs_to :shop
      t.belongs_to :category
    end
  end

  def down
    drop_table :products
  end
end
