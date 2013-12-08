class Api::V1::LikesController < ApplicationController
  respond_to :json

  # POST /api/v1/movies/:movie_id/users/:user_id/likes
  def create
    movie = Movie.find_by_id params[:movie_id]
    return render json: { errors: "Movie not found" }, status: 404 unless movie

    user  = User.find_by_id params[:user_id]
    return render json: { errors: "User not found" }, status: 404 unless user

    like =  Like.create user_id: user.id, movie_id: movie.id

    if like.valid?
      render json: like, status: 201 #creation response
    else
      render json: like.errors, status: 404 #error
    end
  end

  # DELETE /api/v1/likes/:id
  def destroy
    @like = Like.find_by_id(params[:id])
    return render json: { errors: "Like not found" }, status: 404 unless @like
    
    @like.destroy
    render json: @like, status: 204 #no_content
  end
end
