module MoviesHelper
  def average_review_score
    (@movie.reviews.reduce(0){|score, r| score + r.rating } / @movie.reviews.length.to_f).round(1)
  end
end
