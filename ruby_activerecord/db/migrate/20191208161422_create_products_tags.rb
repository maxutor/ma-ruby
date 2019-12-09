class CreateProductsTags < ActiveRecord::Migration[5.1]
  #def up
  #  create_join_table :products, :tags do |t|
  #    t.index :product_id
  #    t.index :tag_id
  #  end
  #end
  #
  #def down
  #  drop_join_table :products, :tags
  #end
  def change
    create_table :products_tags, id: false do |t|
      t.belongs_to :product
      t.belongs_to :tag
    end
  end
end
