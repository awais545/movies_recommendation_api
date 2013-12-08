Getting Started
---------------


 1. `bundle install command` 
 2. `bundle exec rake db:create`
 3. `bundle exec rake db:migrate`

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
