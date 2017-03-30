module ReviewsHelper

  def reviews_find_movie

  end

  def find_reviews_by_user
    if user_signed_in?
      current_user.reviews
    end
  end

  def has_already_reviewed?
    if !user_signed_in?
      return true
    else
      find_reviews_by_user.any?{|r| r.movie_id == params[:movie_id]}
    end
  end

  def has_already_reviewed_show?
    if !user_signed_in?
      return true
    else
      find_reviews_by_user.any?{|r| r.movie_id == params[:id]}
    end
  end
end

