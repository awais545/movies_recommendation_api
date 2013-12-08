require 'spec_helper'

describe 'Movie Api' do
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
        JSON.load(response.body)['message'].should == 'Invalid JSON payload'
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
        response.code.should eql "204"
      end
    end

    context "movie with invalid id" do
      it "should give the error message" do
        delete "api/v1/movies/1"
        response.code.should eql "404"
        JSON.load(response.body)['errors'].should eql "Movie not found"
      end
    end
  end
end
