class ImdbWorker
  include Sidekiq::Worker
	sidekiq_options retry: false

  def perform(movie_title)
  	imdb = Imdb::Search::new(movie_title)

  	if imdb.movies.first.title.present?
	  	rating = imdb.movies.first.rating
	  	movie  = Movie.find_by_title(movie_title)
	  	puts movie.update_attribute :rating, rating
	  end
  end
end