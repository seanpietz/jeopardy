class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_number
      t.date :air_date

      t.timestamps
    end
  end
end
