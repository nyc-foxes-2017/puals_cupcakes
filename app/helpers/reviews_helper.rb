module ReviewsHelper

  def reviews_find_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end

end
