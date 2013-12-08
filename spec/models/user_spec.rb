require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.create(:user) }

	describe "Associations" do
		it { should have_many(:likes) }
	end

	describe "Validations" do
		it { should validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email) }

		context "user with invalid email" do
			before  { user.email = 'foo@bar+baz.com' }
			specify { user.should_not be_valid }
		end
	end
end
