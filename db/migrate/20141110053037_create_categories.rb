class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :episode
      t.string :category
      t.string :round
      t.integer :episode_id

      t.timestamps
    end
  end
end
