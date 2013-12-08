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
end
