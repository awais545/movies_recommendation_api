class AddRatingToMovie < ActiveRecord::Migration
  def change
  	add_column :movies, :rating, :integer, default: 0
  end
end
