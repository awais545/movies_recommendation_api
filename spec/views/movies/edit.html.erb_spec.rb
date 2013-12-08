require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :title => "MyString",
      :release_year => 1,
      :genres => "MyText"
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_title[name=?]", "movie[title]"
      assert_select "input#movie_release_year[name=?]", "movie[release_year]"
      assert_select "textarea#movie_genres[name=?]", "movie[genres]"
    end
  end
end
