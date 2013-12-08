require 'spec_helper'

describe 'User Api' do
  describe "POST create" do
    context "with valid attributes" do
      it "should create the user" do
        post api_v1_users_path, FactoryGirl.attributes_for(:user).to_json
        user_id = JSON.load(response.body)['id']
        response.status.should == 201
      end    
    end

    context "with invalid attributes" do
      it "should not create the user" do
        User.any_instance.stub(:save).and_return(false)
        post api_v1_users_path, FactoryGirl.attributes_for(:user).to_json
        response.status.should == 404
      end
    end

    context "with invalid format" do
      it "should give error message" do
        post api_v1_users_path, FactoryGirl.attributes_for(:user)
        response.status.should == 400
        JSON.parse(response.body)['message'].should == 'Invalid JSON payload'
      end    
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      it "should allow to update user" do
        user = FactoryGirl.create :user
        put api_v1_user_path(user), { name: 'Awais' }.to_json
        response.status.should == 200
      end
    end

    context "with invalid attributes" do
      it "should not allow to update user" do
        user = FactoryGirl.create :user
        User.any_instance.stub(:update_attributes).and_return(false)
        put api_v1_user_path(user), { name: 'Awais' }.to_json
        response.status.should == 422
      end
    end
  end

  describe "DELETE destroy" do
    context "user with valid id" do
      it "should destroys the requested user" do
        user = FactoryGirl.create :user
        delete "api/v1/users/#{user.id}"
        response.code.should eql "204"
      end
    end

    context "user with invalid id" do
      it "should give the error message" do
        delete "api/v1/users/1"
        response.code.should eql "404"
        JSON.parse(response.body)['errors'].should eql "User not found"
      end
    end
  end
end
