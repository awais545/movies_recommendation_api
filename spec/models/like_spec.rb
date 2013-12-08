require 'spec_helper'

describe Like do
	describe "Associations" do
		it { should belong_to(:user) }
		it { should belong_to(:movie) }
	end

	describe "Validations" do
		it { should validate_presence_of(:movie_id) }
		it { should validate_presence_of(:user_id) }
		it { should validate_uniqueness_of(:movie_id).scoped_to(:user_id).with_message("You have already like this movie") }
	end
end
