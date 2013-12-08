require 'spec_helper'

describe 'Like Api' do
  let!(:movie)    { FactoryGirl.create :movie }
  let!(:user)     { FactoryGirl.create :user }

  describe "POST create" do
    context "when user try to like the movie first time" do
      it "should allow the user to like the movies" do
        post api_v1_movie_user_likes_path(movie, user)
        like_id = JSON.load(response.body)['id']
        response.status.should == 201
      end
    end

    context "when user try to like the movie n time (n > 1)" do
      it "should not create the like" do
        like = Like.create movie_id: movie.id, user_id: user.id
        post api_v1_movie_user_likes_path(movie, user)
        response.status.should == 404
      end
    end
  end

  describe "DELETE destroy" do
    context "when user try to unlike the movie" do
      it "should destroy the liked movie" do
        like = Like.create movie_id: movie.id, user_id: user.id
        delete "api/v1/likes/#{like.id}"
        response.code.should eql "204"
      end
    end

    context "when user request to unlike the movie he hasn't liked" do
      it "should give the error message" do
        delete "api/v1/movies/1"
        response.code.should eql "404"
      end
    end
  end
end
Like