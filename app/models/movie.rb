class Movie < ActiveRecord::Base
  attr_accessible :genres, :release_year, :title

  has_many :likes

  serialize :genres, Array

  validates :title, presence: true
end
