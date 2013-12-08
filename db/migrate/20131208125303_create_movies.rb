class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.text :genres

      t.timestamps
    end
  end
end
