require 'spec_helper'

describe 'Movie Api' do
  describe "GET index" do
    context "only show the currently playing movies" do
      it "should return all movies" do
        get api_v1_movies_path
        Movie.currently_playing.count.should == JSON.load(response.body).count
      end    
    end

    describe "Filters" do
      context "upcoming movies" do
        it "should list all movies comming in future" do
          get api_v1_movies_path(upcoming_movies: true)
          Movie.upcoming.count == JSON.load(response.body).count
        end
      end

      context "when query string is given" do
        # search on title
        it "should only show the movie matching title" do
          get api_v1_movies_path, { query: "How to train a dragon" }
          JSON.load(response.body).count.should == 1
        end
      end
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "should create the movie" do
        post api_v1_movies_path, FactoryGirl.attributes_for(:movie).to_json
        movie_id = JSON.load(response.body)['id']
        response.status.should == 201
      end    
    end

    context "with invalid attributes" do
      it "should not create the movie" do
        Movie.any_instance.stub(:save).and_return(false)
        post api_v1_movies_path, FactoryGirl.attributes_for(:movie).to_json
        response.status.should == 404
      end
    end

    context "with invalid format" do
      it "should give error message" do
        post api_v1_movies_path, FactoryGirl.attributes_for(:movie)
        response.status.should == 400
        JSON.load(response.body)['errors'].should eql I18n::t('invalid_format')
      end    
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      it "should allow to update movie" do
        movie = FactoryGirl.create :movie
        put api_v1_movie_path(movie), { release_year: 2012 }.to_json
        response.status.should == 200
      end
    end

    context "with invalid attributes" do
      it "should not allow to update movie" do
        movie = FactoryGirl.create :movie
        Movie.any_instance.stub(:update_attributes).and_return(false)
        put api_v1_movie_path(movie), { release_year: 2012 }.to_json
        response.status.should == 422
      end
    end
  end

  describe "DELETE destroy" do
    context "movie with valid id" do
      it "destroys the requested movie" do
        movie = FactoryGirl.create :movie
        delete "api/v1/movies/#{movie.id}"
        response.code.should == "204"
      end
    end

    context "movie with invalid id" do
      it "should give the error message" do
        delete "api/v1/movies/1"
        response.code.should eql "404"
        JSON.load(response.body)['errors'].should eql I18n::t('movie_not_found')
      end
    end
  end
end
