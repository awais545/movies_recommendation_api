class Movie < ActiveRecord::Base
  attr_accessible :genres, :release_year, :title, :rating

	include Tire::Model::Search
	include Tire::Model::Callbacks

	scope :currently_playing, lambda { where("release_year <= ?", Date.today.year) }
	scope :upcoming,          lambda { where("release_year > ?",  Date.today.year) }

  has_many :likes

  serialize :genres, Array

  validates :title, presence: true

  after_create :map_imdb_rating

	def self.search(params)
		tire.search do
			query { string params[:query], default_operator: "AND" } if params[:query].present?
			
			if params[:upcoming_movies].blank?
				filter :range, release_year: { lte: Time.zone.now.year } 
			else
				filter :range, release_year: { gt: Time.zone.now.year }
			end
		end
	end

	def to_indexed_json
 		to_json
 	end

 	def map_imdb_rating
 		ImdbWorker.perform_async(self.title)
 	end
end
