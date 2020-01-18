class AddValidationToQuestion < ActiveRecord::Migration[5.1]
  change_table :questions do |t|
    t.change :username, :string, null: false, default: 'Anon'
  end
end
