# frozen_string_literal: true

module Api::V1
  class MoviesController < ApiController
    before_action :admin_access

    def index
      movies = Movie.page(params[:page])

      render json: movies, root: 'movies', meta: { pagination: pagination(movies) }
    end

    # POST /api/v1/movies
    def create
      movie = Movie.new(create_params)

      if movie.save
        success_response(movie, 201)
      else
        error_response(movie.errors.messages)
      end
    end

    # PUT /api/v1/movies/:id
    def update
      movie = Movie.find(params[:id])

      if movie.update(update_params)
        success_response(movie)
      else
        error_response(movie.errors.messages)
      end
    rescue ActiveRecord::RecordNotFound
      error_response('Not found', 404)
    end

    private

    def create_params
      params.permit(:name, :runtime, :buffer, :details)
    end

    def update_params
      params.permit(:details)
    end
  end
end
