require 'spec_helper'

describe "likes/new" do
  before(:each) do
    assign(:like, stub_model(Like).as_new_record)
  end

  it "renders new like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", likes_path, "post" do
    end
  end
end
