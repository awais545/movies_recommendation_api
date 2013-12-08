class Like < ActiveRecord::Base
	attr_accessible :user_id, :movie_id

	belongs_to :user
  belongs_to :movie

	validates :movie_id, :user_id, presence: true
	validates :movie_id, uniqueness: { scope: :user_id, message: 'You have already like this movie' }
end
