class Movie < ActiveRecord::Base
  attr_accessible :genres, :release_year, :title
end
