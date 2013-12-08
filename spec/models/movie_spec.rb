require 'spec_helper'

describe Movie do
	context "Associations" do
  	it { should have_many(:likes) }
  end

  context "Validations" do
		it { should validate_presence_of(:title) }
		it { should serialize(:genres).as(Array) }
	end
end
