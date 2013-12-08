require 'spec_helper'

describe "movies/new" do
  before(:each) do
    assign(:movie, stub_model(Movie,
      :title => "MyString",
      :release_year => 1,
      :genres => "MyText"
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movies_path, "post" do
      assert_select "input#movie_title[name=?]", "movie[title]"
      assert_select "input#movie_release_year[name=?]", "movie[release_year]"
      assert_select "textarea#movie_genres[name=?]", "movie[genres]"
    end
  end
end
