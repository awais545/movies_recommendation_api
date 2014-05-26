Getting Started
---------------
`sudo apt-get update`
`sudo apt-get install openjdk-7-jre-headless -y`

# EASY Installation of ElasticSearch
`wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb`
`sudo dpkg -i elasticsearch-1.1.1.deb`

# Start ElasticSearch
`sudo service elasticsearch start`

`wget http://download.redis.io/redis-stable.tar.gz`
`tar xvzf redis-stable.tar.gz`
`cd redis-stable`
`sudo make install`
`cd utils`
`sudo ./install_server.sh`

# start redis, Suggestion: You might want to create alias for the following commands ;)
`sudo service redis_6379 start`
`sudo service redis_6379 stop`


 1. `bundle install command` 
 2. `bundle exec rake db:create`
 3. `bundle exec rake db:migrate`

------------

New Features
------------

You can search the movie by title, genres and release year.
User might be interested in view the rating of movie from IMDB. So after movie creation fetch the rating from IMDB and save at our end.

I am using ElasticSearch for fast quering the result. There are other options too like Sunspot or ThinkingSphinx. Beside this, as we are using 3rd party service ( IMDB API ) for getting the rating, I believe its better we update it in a background job, for that purpose I am using Sidekiq which uses Redis. Other options are delayedjob or rescue.
----------

Description
-----------

This is Simple but interesting. API using which you can, create, update and delete user and movies. User can like the movie's. But the condition on liking is, s/he can only like the movie once.

Controllers are present at ``app/controllers/api/v1/`` folder
Integration specs for API are located at ``spec/api/v1/`` folder
Model's specs are at ``spec/models/``

----------

API Routes
----------
**User**

  
      POST   /api/v1/users/
      UPDATE /api/v1/users/:id
      DELETE /api/v1/users/:id


**Movie**

      POST   /api/v1/movies/
      UPDATE /api/v1/movies/:id
      DELETE /api/v1/movies/:id


**Like**
  
    POST   /api/v1/movies/:movie_id/users/:user_id/like
    DELETE /api/v1/likes/:id


----------

TODO
----

 1. Api Authentication
 2. Get the top rated movies
 3. Get the movies liked by user
 4. A complete recommendation engine can be develop from this.
 

----
