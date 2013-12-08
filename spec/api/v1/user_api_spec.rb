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
  end
end
