class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category
      t.string :question
      t.integer :value
      t.string :answer
      t.integer :category_id

      t.timestamps
    end
  end
end
