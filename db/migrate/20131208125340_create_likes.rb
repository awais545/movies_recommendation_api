class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.belongs_to :user
  		t.belongs_to :movie
      
      t.timestamps
    end

    add_index :likes, [:user_id, :movie_id]
  end
end
