
Movie.create title: "The Wolf of Wall Street", release_year: 2013, genres: [ "Biography", "Comedy", "Crime" ]  
Movie.create title: "A beautiful mind",        release_year: 2001, genres: [ "Biography", "Drama" ]
Movie.create title: "Iron Man",                release_year: 2008, genres: [ "Action", "Adventure" ]
Movie.create title: "Man of Steel",            release_year: 2013, genres: [ "Action", "Adventure" ] 
Movie.create title: "Kungfu Panda",            release_year: 2008, genres: [ "Animation", "Comedy" ]
Movie.create title: "How to train a dragon",   release_year: 2010, genres: [ "Animation", "Comedy" ]
Movie.create title: "Catch me if you can",     release_year: 2002, genres: [ "Crime", "Adventure" ]

# up coming movies
Movie.create title: "Foo",        release_year: Date.today.year + 1, genres: [ "Cartoon", "Animation" ]
Movie.create title: "Bar",        release_year: Date.today.year + 1, genres: [ "Comedy", "Horror" ]
Movie.create title: "Helloworld", release_year: Date.today.year + 1, genres: [ "Adventure", "Crime" ]

user = User.create name: "Muhammad Awais", email: "awais545@gmail.com"

user.likes.create movie_id: 1
user.likes.create movie_id: 2