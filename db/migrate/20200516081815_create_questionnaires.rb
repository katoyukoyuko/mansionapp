class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.integer :question1, null: false
      t.integer :question2, null: false
      t.integer :question3, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
