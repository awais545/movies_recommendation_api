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

  # PUT /api/v1/movies/:id
  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
      render json: @movie, status: 200
    else
      render json: @movie.errors, status: 422
    end
  end

  # DELETE /api/v1/movies/:id
  def destroy
    @movie = Movie.find_by_id(params[:id])
    return render :json => { :errors => "Movie not found" }, status: 404 unless @movie
    
    @movie.destroy
    render json: @movie, status: 204 #no_content
  end
end
