class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end
  def show
    @movie = Movie.find(params[:id])
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
    @movies = Movie.where("title ~* ?", params[:search])

  end
  private
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :age_rating, :duration)
    end

end
