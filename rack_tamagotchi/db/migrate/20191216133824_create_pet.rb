class CreatePet < ActiveRecord::Migration[5.1]
  def up
    create_table :pets do |t|
      t.string :name
      t.string :mood, default: 'good'
      t.integer :hunger, default: 80
      t.integer :health, default: 80
      t.boolean :is_alive, default: true, null: false
    end
  end

  def down
    drop_table :pets
  end
end
