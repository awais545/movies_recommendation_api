class Api::V1::MoviesController < ApplicationController
  respond_to :json

  def index
    render json: Movie.search(params), status: 201
  end

  # POST /api/v1/movies
  def create
    params_data = parse_json_request
    return render json: { errors: I18n::t('invalid_format') }, status: 400 unless params_data
    
    @movie = Movie.new(params_data)

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
    return render json: { :errors => I18n::t('movie_not_found') }, status: 404 unless @movie
    
    @movie.destroy
    render json: @movie, status: 204 #no_content
  end
end
