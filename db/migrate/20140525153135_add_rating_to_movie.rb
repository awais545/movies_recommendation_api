class AddRatingToMovie < ActiveRecord::Migration
  def change
  	add_column :movies, :rating, :float, default: 0
  end
end
