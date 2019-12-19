class CreateQuestions < ActiveRecord::Migration[5.1]
  def up
    create_table :questions do |t|
      t.string :comment
      t.string :username
      t.boolean :is_open
      t.string :admin_answer
      t.belongs_to :product
    end
  end

  def down
    drop_table :questions
  end
end
