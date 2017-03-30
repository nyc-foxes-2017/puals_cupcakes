module MoviesHelper
  def average_review_score
    (@movie.reviews.reduce(0){|score, r| score + r.rating } / @movie.reviews.length.to_f).round(1)
  end

  def find_recent_movies
    recent_reviews = Review.all.order("created_at DESC").limit(5)
    @movies_list = recent_reviews.map{ |review| get_movie_by_id( review[:movie_id]) }
  end
end
