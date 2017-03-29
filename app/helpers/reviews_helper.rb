module ReviewsHelper

  def reviews_find_movie

  end

  def find_reviews_by_user
    current_user.reviews
  end

  def has_already_reviewed?
    if !user_signed_in?
      return false
    end
    find_reviews_by_user.any?{|r| r.movie_id == params[:movie_id]}
  end

end
