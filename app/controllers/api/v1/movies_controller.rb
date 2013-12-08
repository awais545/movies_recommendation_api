class Api::V1::MoviesController < ApplicationController
  respond_to :json

  # POST /api/v1/movies
  def create
    content = parse_request_body
    return json_format_error unless content
    
    @movie = Movie.new(content)

    if @movie.save
      render json: @movie, status: 201
    else
      render json: @movie.errors, status: 404
    end
  end
end
