class CreateCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :categories do |t|
      t.string :title
    end
  end

  def down
    drop_table :categories
  end
end
