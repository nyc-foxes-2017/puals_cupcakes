class MoviesController < ApplicationController
  include MoviesHelper
  include ApplicationHelper
  require 'open-uri'

  def index
    find_recent_movies
    find_opening_movies
    find_best_movies
    find_top_box
  end

  def show
    @movie = get_movie_by_id(params[:id])
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
