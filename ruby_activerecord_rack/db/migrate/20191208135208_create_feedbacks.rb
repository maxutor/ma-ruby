class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def up
    create_table :feedbacks do |t|
      t.integer :rate
      t.string :comment
      t.string :username
      t.belongs_to :product
    end
  end

  def down
    drop_table :feedbacks
  end
end
