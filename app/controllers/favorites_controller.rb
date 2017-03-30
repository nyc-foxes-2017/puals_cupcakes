class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(movie_id: params[:movie_id], user_id: current_user.id)
    @favorite.save
    redirect_to "movies#show"
  end

  def destroy
    @favorite = Favorite.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to "movies#show"
  end

end
