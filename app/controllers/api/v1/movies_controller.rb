class Api::V1::MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :update, :destroy]
    skip_before action :authenticate, only: [:index, :show]
    #Get /movies
    def index
        @movies = Movie.all
        render json: @movies
    end

    #Get /movies/1
    def show
        @review = Review.where(movie_id: params[:id])
        render json: ( movie: @movie, reviews: @reviews )
    end

    #Post /movies
    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            render json: @movie
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    #Patch/Put /movies/1
    def update
        if @movie.update(movie_params)
            render json: @movie
        else
            render json: @movie.errors, status: :upprocessable_entity
    
        end
    end

    #Delete /movie/1
    def destroy
        @movie.destroy
    end

    # Get our Amazone S3 keys for uploads
    def get_upload_credentials
        @accessKey = ENV['S3_ACCESS']
        @secertKey = ENV ['S3_SECERT']
        render json: { accessKey: @accessKey, secertKey: @secertKey }
    end

    private
    #Methods we place in private can only be accessed by other methods in our movies controller

    def set_movie
        @Movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit( *filters :title, :description, :parental_rating, :year, :total_gross, :duration, :image, :cast, :director)
    end
end

