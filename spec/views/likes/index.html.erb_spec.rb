require 'spec_helper'

describe "likes/index" do
  before(:each) do
    assign(:likes, [
      stub_model(Like),
      stub_model(Like)
    ])
  end

  it "renders a list of likes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
