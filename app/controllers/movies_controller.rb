class MoviesController < ApplicationController
  include MoviesHelper
  include ApplicationHelper
  require 'open-uri'

  def index
    find_recent_movies
    find_opening_movies
    find_best_movies
  end

  def show
    @movie = get_movie_by_id(params[:id])
  end

  def new
    @movie = Movie.new
  end
  def edit
    @movie = Movie.find(params[:id])
  end
  def create
    @movie = Movie.new()

    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end

  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  def search

    #Will return all movies containing the given search term
    #Case insensitive
    @movies_list = search_omdb(params[:movies][:search])

  end
  private
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :age_rating, :duration)
    end

end
