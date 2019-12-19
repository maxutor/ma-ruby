class AddValidationToFeedback < ActiveRecord::Migration[5.1]
  change_table :feedbacks do |t|
    t.change :username, :string, null: false, default: 'Anon'
  end
end
