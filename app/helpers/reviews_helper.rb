module ReviewsHelper

  def reviews_find_movie
    @movie = Movie.find_by(id: params[:movie_id])
  end

  def find_reviews_by_user
    reviews_find_movie
    @movie.reviews.find_by(user_id: current_user.id)
  end

  def has_already_reviewed?
    !!find_reviews_by_user
  end

end
