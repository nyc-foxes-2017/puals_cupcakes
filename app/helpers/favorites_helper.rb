module FavoritesHelper

  def find_favorites_by_user
    if user_signed_in?
      current_user.favorites
    end
  end
def has_already_favorited?
    if !user_signed_in?
      return true
    else
      find_favorites_by_user.any?{|f| f.movie_id == params[:id]}
    end
  end
end
